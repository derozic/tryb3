import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/websocket_service.dart';
import '../../../tux/tux.dart';

class WebSocketStatusWidget extends ConsumerWidget {
  const WebSocketStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<WebSocketConnectionState>(
      stream: ref.watch(webSocketConnectionStateProvider),
      builder: (context, snapshot) {
        final state = snapshot.data ?? WebSocketConnectionState.disconnected;
        
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TuxSpacing.sm,
            vertical: TuxSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: _getBackgroundColor(state),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getBorderColor(state),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getStatusIcon(state),
              const SizedBox(width: TuxSpacing.xs),
              Text(
                _getStatusText(state),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _getTextColor(state),
                ),
              ),
              if (state == WebSocketConnectionState.error) ...[
                const SizedBox(width: TuxSpacing.xs),
                GestureDetector(
                  onTap: () => _showErrorDetails(context, ref),
                  child: Icon(
                    Icons.info_outline,
                    size: 14,
                    color: _getTextColor(state),
                  ),
                ),
              ],
              if (state == WebSocketConnectionState.disconnected ||
                  state == WebSocketConnectionState.error) ...[
                const SizedBox(width: TuxSpacing.xs),
                GestureDetector(
                  onTap: () => _reconnect(ref),
                  child: Icon(
                    Icons.refresh,
                    size: 14,
                    color: _getTextColor(state),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _getStatusIcon(WebSocketConnectionState state) {
    switch (state) {
      case WebSocketConnectionState.connected:
        return Icon(
          Icons.circle,
          size: 8,
          color: TuxColors.success,
        );
      case WebSocketConnectionState.connecting:
      case WebSocketConnectionState.reconnecting:
        return SizedBox(
          width: 8,
          height: 8,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            valueColor: AlwaysStoppedAnimation(TuxColors.warning),
          ),
        );
      case WebSocketConnectionState.error:
        return Icon(
          Icons.error,
          size: 8,
          color: TuxColors.error,
        );
      case WebSocketConnectionState.disconnected:
        return Icon(
          Icons.circle,
          size: 8,
          color: TuxColors.gray400,
        );
    }
  }

  String _getStatusText(WebSocketConnectionState state) {
    switch (state) {
      case WebSocketConnectionState.connected:
        return 'Live';
      case WebSocketConnectionState.connecting:
        return 'Connecting';
      case WebSocketConnectionState.reconnecting:
        return 'Reconnecting';
      case WebSocketConnectionState.error:
        return 'Error';
      case WebSocketConnectionState.disconnected:
        return 'Offline';
    }
  }

  Color _getBackgroundColor(WebSocketConnectionState state) {
    switch (state) {
      case WebSocketConnectionState.connected:
        return TuxColors.success.withOpacity(0.1);
      case WebSocketConnectionState.connecting:
      case WebSocketConnectionState.reconnecting:
        return TuxColors.warning.withOpacity(0.1);
      case WebSocketConnectionState.error:
        return TuxColors.error.withOpacity(0.1);
      case WebSocketConnectionState.disconnected:
        return TuxColors.gray100;
    }
  }

  Color _getBorderColor(WebSocketConnectionState state) {
    switch (state) {
      case WebSocketConnectionState.connected:
        return TuxColors.success.withOpacity(0.3);
      case WebSocketConnectionState.connecting:
      case WebSocketConnectionState.reconnecting:
        return TuxColors.warning.withOpacity(0.3);
      case WebSocketConnectionState.error:
        return TuxColors.error.withOpacity(0.3);
      case WebSocketConnectionState.disconnected:
        return TuxColors.gray300;
    }
  }

  Color _getTextColor(WebSocketConnectionState state) {
    switch (state) {
      case WebSocketConnectionState.connected:
        return TuxColors.success;
      case WebSocketConnectionState.connecting:
      case WebSocketConnectionState.reconnecting:
        return TuxColors.warning;
      case WebSocketConnectionState.error:
        return TuxColors.error;
      case WebSocketConnectionState.disconnected:
        return TuxColors.gray600;
    }
  }

  void _showErrorDetails(BuildContext context, WidgetRef ref) {
    final webSocketService = ref.read(webSocketServiceProvider);
    final error = webSocketService.lastError ?? 'Unknown error occurred';

    TuxModal.show(
      context: context,
      title: const Text('WebSocket Error'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Connection failed with the following error:'),
          const SizedBox(height: TuxSpacing.sm),
          Container(
            padding: const EdgeInsets.all(TuxSpacing.sm),
            decoration: BoxDecoration(
              color: TuxColors.gray100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              error,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          const Text(
            'Tips for troubleshooting:',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: TuxSpacing.xs),
          const Text('• Check if the WebSocket server is running'),
          const Text('• Verify the server URL is correct'),
          const Text('• Check your network connection'),
          const Text('• Try refreshing the page'),
        ],
      ),
      actions: [
        TuxButton(
          text: 'Retry Connection',
          onPressed: () {
            Navigator.of(context).pop();
            _reconnect(ref);
          },
        ),
        TuxButton(
          text: 'Enable Mock Mode',
          variant: TuxButtonVariant.secondary,
          onPressed: () {
            Navigator.of(context).pop();
            webSocketService.enableMockMode();
            TuxToast.showInfo(
              context: context,
              message: 'Mock mode enabled - simulated events will appear',
            );
          },
        ),
      ],
    );
  }

  void _reconnect(WidgetRef ref) {
    final webSocketService = ref.read(webSocketServiceProvider);
    webSocketService.connect();
  }
}

class WebSocketDebugPanel extends ConsumerWidget {
  const WebSocketDebugPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TuxCard(
      variant: TuxCardVariant.outlined,
      header: const Row(
        children: [
          Icon(Icons.settings_ethernet, size: 20),
          SizedBox(width: TuxSpacing.xs),
          Text(
            'WebSocket Debug Panel',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('Connection Status: '),
              WebSocketStatusWidget(),
            ],
          ),
          const SizedBox(height: TuxSpacing.md),
          const Text(
            'Quick Actions:',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: TuxSpacing.sm),
          Wrap(
            spacing: TuxSpacing.sm,
            runSpacing: TuxSpacing.xs,
            children: [
              TuxButton(
                text: 'Connect',
                size: TuxButtonSize.small,
                onPressed: () {
                  final service = ref.read(webSocketServiceProvider);
                  service.connect();
                },
              ),
              TuxButton(
                text: 'Disconnect',
                variant: TuxButtonVariant.secondary,
                size: TuxButtonSize.small,
                onPressed: () {
                  final service = ref.read(webSocketServiceProvider);
                  service.disconnect();
                },
              ),
              TuxButton(
                text: 'Mock Mode',
                variant: TuxButtonVariant.ghost,
                size: TuxButtonSize.small,
                onPressed: () {
                  final service = ref.read(webSocketServiceProvider);
                  service.enableMockMode();
                  TuxToast.showSuccess(
                    context: context,
                    message: 'Mock events enabled',
                  );
                },
              ),
              TuxButton(
                text: 'Test Event',
                backgroundColor: TuxColors.info,
                size: TuxButtonSize.small,
                onPressed: () {
                  final service = ref.read(webSocketServiceProvider);
                  service.sendMessage(
                    WebSocketEventType.notificationReceived,
                    {
                      'id': 'test_${DateTime.now().millisecondsSinceEpoch}',
                      'message': 'Test notification from debug panel',
                      'type': 'general',
                    },
                  );
                  TuxToast.showInfo(
                    context: context,
                    message: 'Test event sent',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../tux/theme/tux_spacing.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.colorScheme.outline.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // TODO: Show attachment options
              _showAttachmentOptions(context);
            },
            icon: const Icon(Icons.add),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline.withOpacity(0.2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: TuxSpacing.md,
                    vertical: TuxSpacing.sm,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // TODO: Show emoji picker
                    },
                    icon: const Icon(Icons.emoji_emotions),
                  ),
                ),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),
          const SizedBox(width: TuxSpacing.sm),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              final hasText = value.text.trim().isNotEmpty;
              
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: FloatingActionButton.small(
                  onPressed: hasText ? onSend : null,
                  backgroundColor: hasText 
                      ? theme.colorScheme.primary 
                      : theme.colorScheme.outline.withOpacity(0.2),
                  child: Icon(
                    Icons.send,
                    color: hasText 
                        ? theme.colorScheme.onPrimary 
                        : theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(TuxSpacing.md),
            child: Text(
              'Send attachment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: const EdgeInsets.all(TuxSpacing.md),
            children: [
              _AttachmentOption(
                icon: Icons.photo_camera,
                label: 'Camera',
                color: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Open camera
                },
              ),
              _AttachmentOption(
                icon: Icons.photo_library,
                label: 'Gallery',
                color: Colors.green,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Open gallery
                },
              ),
              _AttachmentOption(
                icon: Icons.videocam,
                label: 'Video',
                color: Colors.red,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Record video
                },
              ),
              _AttachmentOption(
                icon: Icons.mic,
                label: 'Audio',
                color: Colors.orange,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Record audio
                },
              ),
              _AttachmentOption(
                icon: Icons.attach_file,
                label: 'File',
                color: Colors.purple,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Pick file
                },
              ),
              _AttachmentOption(
                icon: Icons.location_on,
                label: 'Location',
                color: Colors.teal,
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Share location
                },
              ),
            ],
          ),
          const SizedBox(height: TuxSpacing.md),
        ],
      ),
    );
  }
}

class _AttachmentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AttachmentOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: TuxSpacing.sm),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
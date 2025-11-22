import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import '../tux/components/tux_button.dart';
import '../tux/components/tux_input.dart';
import '../tux/components/tux_card.dart';
import '../tux/components/tux_modal.dart';
import '../tux/components/tux_toast.dart';
import '../tux/tokens/colors.dart';
import '../tux/tokens/spacing.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) {
        return MaterialApp(
          title: 'Tux Component Library',
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      directories: [
        WidgetbookFolder(
          name: '🎨 Design Tokens',
          children: [
            WidgetbookFolder(
              name: 'Colors',
              children: [
                WidgetbookComponent(
                  name: 'Color Palette',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'All Colors',
                      builder: (context) => const ColorPaletteView(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Spacing',
              children: [
                WidgetbookComponent(
                  name: 'Spacing Scale',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'All Spacings',
                      builder: (context) => const SpacingScaleView(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: '🧩 Components',
          children: [
            WidgetbookComponent(
              name: 'TuxButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final label = context.knobs.string(
                      label: 'Label',
                      initialValue: 'Click me',
                    );
                    
                    final variant = context.knobs.list(
                      label: 'Variant',
                      options: TuxButtonVariant.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final size = context.knobs.list(
                      label: 'Size',
                      options: TuxButtonSize.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final isLoading = context.knobs.boolean(
                      label: 'Loading',
                      initialValue: false,
                    );
                    
                    final isDisabled = context.knobs.boolean(
                      label: 'Disabled',
                      initialValue: false,
                    );
                    
                    final isFullWidth = context.knobs.boolean(
                      label: 'Full Width',
                      initialValue: false,
                    );
                    
                    final hasLeadingIcon = context.knobs.boolean(
                      label: 'Leading Icon',
                      initialValue: false,
                    );
                    
                    final hasTrailingIcon = context.knobs.boolean(
                      label: 'Trailing Icon',
                      initialValue: false,
                    );
                    
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(TuxSpacing.lg),
                        child: TuxButton(
                          label: label,
                          variant: variant,
                          size: size,
                          isLoading: isLoading,
                          isDisabled: isDisabled,
                          isFullWidth: isFullWidth,
                          leadingIcon: hasLeadingIcon ? Icons.star : null,
                          trailingIcon: hasTrailingIcon ? Icons.arrow_forward : null,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$label clicked!')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'All Variants',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(TuxSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final variant in TuxButtonVariant.values) ...[
                          TuxButton(
                            label: variant.name.toUpperCase(),
                            variant: variant,
                            onPressed: () {},
                            isFullWidth: true,
                          ),
                          const SizedBox(height: TuxSpacing.md),
                        ],
                      ],
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'All Sizes',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(TuxSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final size in TuxButtonSize.values) ...[
                          TuxButton(
                            label: '${size.name.toUpperCase()} Button',
                            size: size,
                            onPressed: () {},
                            isFullWidth: true,
                          ),
                          const SizedBox(height: TuxSpacing.md),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TuxInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final label = context.knobs.string(
                      label: 'Label',
                      initialValue: 'Email',
                    );
                    
                    final placeholder = context.knobs.string(
                      label: 'Placeholder',
                      initialValue: 'Enter your email',
                    );
                    
                    final helperText = context.knobs.stringOrNull(
                      label: 'Helper Text',
                      initialValue: 'We\'ll never share your email',
                    );
                    
                    final errorText = context.knobs.stringOrNull(
                      label: 'Error Text',
                    );
                    
                    final size = context.knobs.list(
                      label: 'Size',
                      options: TuxInputSize.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final enabled = context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    );
                    
                    final readOnly = context.knobs.boolean(
                      label: 'Read Only',
                      initialValue: false,
                    );
                    
                    final obscureText = context.knobs.boolean(
                      label: 'Obscure Text',
                      initialValue: false,
                    );
                    
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(TuxSpacing.lg),
                        child: TuxInput(
                          label: label,
                          placeholder: placeholder,
                          helperText: helperText,
                          errorText: errorText,
                          size: size,
                          enabled: enabled,
                          readOnly: readOnly,
                          obscureText: obscureText,
                        ),
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'Input States',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(TuxSpacing.lg),
                    child: Column(
                      children: [
                        TuxInput(
                          label: 'Normal',
                          placeholder: 'Enter text',
                        ),
                        const SizedBox(height: TuxSpacing.lg),
                        TuxInput(
                          label: 'With Helper',
                          placeholder: 'Enter text',
                          helperText: 'This is helper text',
                        ),
                        const SizedBox(height: TuxSpacing.lg),
                        TuxInput(
                          label: 'With Error',
                          placeholder: 'Enter text',
                          errorText: 'This field is required',
                        ),
                        const SizedBox(height: TuxSpacing.lg),
                        TuxInput(
                          label: 'Disabled',
                          placeholder: 'Cannot edit',
                          enabled: false,
                        ),
                        const SizedBox(height: TuxSpacing.lg),
                        TuxInput(
                          label: 'Password',
                          placeholder: 'Enter password',
                          obscureText: true,
                          suffix: Icon(Icons.visibility_off_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TuxCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final variant = context.knobs.list(
                      label: 'Variant',
                      options: TuxCardVariant.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final showDividers = context.knobs.boolean(
                      label: 'Show Dividers',
                      initialValue: false,
                    );
                    
                    final hasHeader = context.knobs.boolean(
                      label: 'Has Header',
                      initialValue: true,
                    );
                    
                    final hasFooter = context.knobs.boolean(
                      label: 'Has Footer',
                      initialValue: true,
                    );
                    
                    final hasActions = context.knobs.boolean(
                      label: 'Has Actions',
                      initialValue: true,
                    );
                    
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(TuxSpacing.lg),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: TuxCard(
                            variant: variant,
                            showDividers: showDividers,
                            header: hasHeader ? const Text(
                              'Card Header',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ) : null,
                            body: const Text(
                              'This is the card body content. It can contain any widget you want to display.',
                            ),
                            footer: hasFooter ? const Text(
                              'Card Footer',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ) : null,
                            actions: hasActions ? [
                              TuxButton(
                                text: 'Cancel',
                                variant: TuxButtonVariant.ghost,
                                size: TuxButtonSize.small,
                                onPressed: () {},
                              ),
                              TuxButton(
                                text: 'Save',
                                size: TuxButtonSize.small,
                                onPressed: () {},
                              ),
                            ] : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'All Variants',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(TuxSpacing.lg),
                    child: Column(
                      children: [
                        for (final variant in TuxCardVariant.values) ...[
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: TuxCard(
                              variant: variant,
                              header: Text(
                                '${variant.name.toUpperCase()} Card',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              body: Text('This is a ${variant.name} card variant.'),
                              actions: [
                                TuxButton(
                                  text: 'Action',
                                  size: TuxButtonSize.small,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: TuxSpacing.lg),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TuxModal',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final size = context.knobs.list(
                      label: 'Size',
                      options: TuxModalSize.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final isDismissible = context.knobs.boolean(
                      label: 'Dismissible',
                      initialValue: true,
                    );
                    
                    final showCloseButton = context.knobs.boolean(
                      label: 'Close Button',
                      initialValue: true,
                    );
                    
                    final hasActions = context.knobs.boolean(
                      label: 'Has Actions',
                      initialValue: true,
                    );
                    
                    return Center(
                      child: TuxButton(
                        text: 'Show Modal',
                        onPressed: () {
                          TuxModal.show(
                            context: context,
                            size: size,
                            isDismissible: isDismissible,
                            showCloseButton: showCloseButton,
                            title: const Text('Modal Title'),
                            content: const Text(
                              'This is the modal content. You can put any widget here.\n\nThis modal is fully customizable with different sizes, actions, and behaviors.',
                            ),
                            actions: hasActions ? [
                              TuxButton(
                                text: 'Cancel',
                                variant: TuxButtonVariant.ghost,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TuxButton(
                                text: 'Confirm',
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ] : null,
                          );
                        },
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'Confirmation Dialog',
                  builder: (context) => Center(
                    child: TuxButton(
                      text: 'Show Confirmation',
                      onPressed: () async {
                        final result = await TuxConfirmDialog.show(
                          context: context,
                          title: 'Confirm Action',
                          message: 'Are you sure you want to delete this item? This action cannot be undone.',
                          confirmText: 'Delete',
                          confirmColor: TuxColors.error,
                        );
                        
                        if (result == true && context.mounted) {
                          TuxToast.showSuccess(
                            context: context,
                            message: 'Item deleted successfully!',
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TuxToast',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final type = context.knobs.list(
                      label: 'Type',
                      options: TuxToastType.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final position = context.knobs.list(
                      label: 'Position',
                      options: TuxToastPosition.values,
                      labelBuilder: (value) => value.name,
                    );
                    
                    final duration = context.knobs.list(
                      label: 'Duration',
                      options: [
                        Duration(seconds: 2),
                        Duration(seconds: 4),
                        Duration(seconds: 6),
                        Duration.zero, // Persistent
                      ],
                      labelBuilder: (value) => value == Duration.zero ? 'Persistent' : '${value.inSeconds}s',
                    );
                    
                    final hasAction = context.knobs.boolean(
                      label: 'Has Action',
                      initialValue: false,
                    );
                    
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TuxButton(
                            text: 'Show Toast',
                            onPressed: () {
                              TuxToast.show(
                                context: context,
                                message: 'This is a ${type.name} toast message!',
                                type: type,
                                position: position,
                                duration: duration,
                                action: hasAction ? TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'UNDO',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ) : null,
                              );
                            },
                          ),
                          const SizedBox(height: TuxSpacing.md),
                          Text(
                            'Quick Actions:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: TuxSpacing.sm),
                          Wrap(
                            spacing: TuxSpacing.sm,
                            children: [
                              TuxButton(
                                text: 'Success',
                                variant: TuxButtonVariant.secondary,
                                size: TuxButtonSize.small,
                                onPressed: () => TuxToast.showSuccess(
                                  context: context,
                                  message: 'Operation completed successfully!',
                                ),
                              ),
                              TuxButton(
                                text: 'Error',
                                variant: TuxButtonVariant.danger,
                                size: TuxButtonSize.small,
                                onPressed: () => TuxToast.showError(
                                  context: context,
                                  message: 'Something went wrong!',
                                ),
                              ),
                              TuxButton(
                                text: 'Warning',
                                backgroundColor: TuxColors.warning,
                                size: TuxButtonSize.small,
                                onPressed: () => TuxToast.showWarning(
                                  context: context,
                                  message: 'Please check your input.',
                                ),
                              ),
                              TuxButton(
                                text: 'Info',
                                backgroundColor: TuxColors.info,
                                size: TuxButtonSize.small,
                                onPressed: () => TuxToast.showInfo(
                                  context: context,
                                  message: 'Here\'s some helpful information.',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// Color Palette View
class ColorPaletteView extends StatelessWidget {
  const ColorPaletteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColorSection('Brand Colors', [
            _ColorTile('Primary', TuxColors.primary),
            _ColorTile('Primary Light', TuxColors.primaryLight),
            _ColorTile('Primary Dark', TuxColors.primaryDark),
            _ColorTile('Secondary', TuxColors.secondary),
            _ColorTile('Secondary Light', TuxColors.secondaryLight),
            _ColorTile('Secondary Dark', TuxColors.secondaryDark),
          ]),
          const SizedBox(height: TuxSpacing.xl),
          _buildColorSection('Semantic Colors', [
            _ColorTile('Success', TuxColors.success),
            _ColorTile('Warning', TuxColors.warning),
            _ColorTile('Error', TuxColors.error),
            _ColorTile('Info', TuxColors.info),
          ]),
          const SizedBox(height: TuxSpacing.xl),
          _buildColorSection('Neutral Colors', [
            _ColorTile('Gray 50', TuxColors.gray50),
            _ColorTile('Gray 100', TuxColors.gray100),
            _ColorTile('Gray 200', TuxColors.gray200),
            _ColorTile('Gray 300', TuxColors.gray300),
            _ColorTile('Gray 400', TuxColors.gray400),
            _ColorTile('Gray 500', TuxColors.gray500),
            _ColorTile('Gray 600', TuxColors.gray600),
            _ColorTile('Gray 700', TuxColors.gray700),
            _ColorTile('Gray 800', TuxColors.gray800),
            _ColorTile('Gray 900', TuxColors.gray900),
          ]),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, List<_ColorTile> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.md),
        Wrap(
          spacing: TuxSpacing.md,
          runSpacing: TuxSpacing.md,
          children: colors,
        ),
      ],
    );
  }
}

class _ColorTile extends StatelessWidget {
  final String name;
  final Color color;

  const _ColorTile(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Spacing Scale View
class SpacingScaleView extends StatelessWidget {
  const SpacingScaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final spacings = [
      ('xxs', TuxSpacing.xxs),
      ('xs', TuxSpacing.xs),
      ('sm', TuxSpacing.sm),
      ('md', TuxSpacing.md),
      ('lg', TuxSpacing.lg),
      ('xl', TuxSpacing.xl),
      ('xxl', TuxSpacing.xxl),
      ('xxxl', TuxSpacing.xxxl),
    ];

    return Padding(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (name, value) in spacings) ...[
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40,
                  width: value,
                  decoration: BoxDecoration(
                    color: TuxColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: TuxSpacing.md),
                Text('${value.toStringAsFixed(0)}px'),
              ],
            ),
            const SizedBox(height: TuxSpacing.sm),
          ],
        ],
      ),
    );
  }
}
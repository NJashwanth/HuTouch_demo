/*[
  {
    "name": "PrimaryButton",
    "description": "A pill-shaped button used for main actions such as 'Sign up free', 'Next', 'Create an account', 'Start Session', and 'Done'. Appears in: Sign-up screen, Create Account flow, Group Session, podcast selection.",
    "standardization": "Parameters include label text, onPress callback, enabled/disabled state, and optional icon/avatar.",
    "styling_changes": "Color may change (green for primary actions, white/gray for others), and minor size or margin tweaks depending on context.",
    "code": "// lib/shared/components/primary-button.dart\nimport 'package:flutter/material.dart';\n\nclass PrimaryButton extends StatelessWidget {\n  final String label;\n  final VoidCallback? onPress;\n  final bool enabled;\n  final Widget? leading;\n  final Color? color;\n  final Color? textColor;\n\n  const PrimaryButton({\n    super.key,\n    required this.label,\n    required this.onPress,\n    this.enabled = true,\n    this.leading,\n    this.color,\n    this.textColor,\n  });\n\n  @override\n  Widget build(BuildContext context) {\n    final theme = Theme.of(context);\n    final bg = (color ?? theme.colorScheme.primary).withOpacity(enabled ? 1 : 0.6);\n    final tc = textColor ?? Colors.black;\n\n    return Material(\n      color: bg,\n      borderRadius: BorderRadius.circular(28),\n      clipBehavior: Clip.antiAlias,\n      child: InkWell(\n        onTap: enabled ? onPress : null,\n        child: Padding(\n          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),\n          child: Row(\n            mainAxisSize: MainAxisSize.min,\n            mainAxisAlignment: MainAxisAlignment.center,\n            children: [\n              if (leading != null) ...[\n                leading!,\n                const SizedBox(width: 8),\n              ],\n              Text(\n                label,\n                style: theme.textTheme.titleMedium?.copyWith(color: tc, fontWeight: FontWeight.w600),\n              ),\n            ],\n          ),\n        ),\n      ),\n    );\n  }\n}\n"
  },
  {
    "name": "SearchBar",
    "description": "A search input field with a search icon and placeholder, used for content search such as 'Artists, songs, or podcasts', artist/podcast selection, playlist search, and recent searches.",
    "standardization": "Parameters include placeholder text, onChangeText callback, leading icon, optional trailing action (e.g. Cancel button).",
    "styling_changes": "Width and margin/padding may shift slightly based on screen or container. Optional cancel button in some cases.",
    "code": ""
  },
  {
    "name": "ProfileAvatar",
    "description": "A circular user profile avatar, optionally with user name and subtitle, used in locations such as the settings header and profile screen.",
    "standardization": "Props for image source, optional username and subtitle, optional onPress event.",
    "styling_changes": "Avatar size may change slightly (larger on profile view, smaller in settings header).",
    "code": ""
  },
  {
    "name": "ListItemWithAvatar",
    "description": "A horizontal list item with a round image, main label, optional secondary label. Used to show items such as artists, playlists, songs. Appears in: Library, Profile Playlists, Recent Searches.",
    "standardization": "Parameters: image source, primary text, secondary text, optional right action/icon.",
    "styling_changes": "Minor padding or font size adjustments. Avatar size can be parameterized.",
    "code": ""
  },
  {
    "name": "OptionsMenuListItem",
    "description": "A vertical menu list item with a leading icon and action text (e.g. 'Like', 'Share', 'Add to playlist', etc.). Appears in multiple options/popover menus for tracks and playlists.",
    "standardization": "Accepts leading icon, label, onPress handler.",
    "styling_changes": "Slight icon or text color changes based on context or selection state.",
    "code": ""
  },
  {
    "name": "ModalHandleBar",
    "description": "A small rounded handle bar used at the top of modal sheets. Appears in: Group Session, Share modal, and additional modals.",
    "standardization": "Can be shown/hidden via boolean. Styling is a rounded rectangle and color for contrast.",
    "styling_changes": "Width/margin may vary slightly to fit each modal width.",
    "code": ""
  }
]*/
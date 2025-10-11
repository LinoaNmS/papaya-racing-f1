// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/use_cases/app_components/gp_card_use_cases.dart'
    as _widgetbook_workspace_use_cases_app_components_gp_card_use_cases;
import 'package:widgetbook_workspace/use_cases/design_system/button_use_cases.dart'
    as _widgetbook_workspace_use_cases_design_system_button_use_cases;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'components',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'PRButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_workspace_use_cases_design_system_button_use_cases
                        .prButtonDefault,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'features',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'gp',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'GpCard',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Monaco',
                    builder:
                        _widgetbook_workspace_use_cases_app_components_gp_card_use_cases
                            .gpCardMonaco,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Monza',
                    builder:
                        _widgetbook_workspace_use_cases_app_components_gp_card_use_cases
                            .gpCardMonza,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Silverstone',
                    builder:
                        _widgetbook_workspace_use_cases_app_components_gp_card_use_cases
                            .gpCardSilverstone,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Spa',
                    builder:
                        _widgetbook_workspace_use_cases_app_components_gp_card_use_cases
                            .gpCardSpa,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];

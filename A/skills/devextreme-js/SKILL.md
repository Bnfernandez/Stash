---
name: devextreme-js
# Match when implementing or modifying any front-end UI in Project A using JavaScript, Razor views, forms, grids, editors, popups, validation, menus, toolbars, or other interactive components.
description: Use DevExtreme JavaScript components for Project A front-end UI. Follow the repository's existing DevExtreme version, initialization patterns, configuration conventions, data sources, events, validation, styling, and Razor integration. Prefer DevExtreme components over custom UI implementations when a suitable component exists.
---

# DevExtreme JavaScript — Project A

## Core rule

Project A uses DevExtreme JavaScript for front-end components. When adding or changing UI behavior, first look for the existing DevExtreme component/pattern already used in the application and follow it.

Prefer a DevExtreme component when a suitable component exists rather than introducing a custom widget or a different component library.

## Before changing UI

- Inspect nearby Razor views and JavaScript to identify the existing DevExtreme component and initialization style.
- Check the actual DevExtreme version and installed packages/assets in the repository instead of assuming a version.
- Reuse the project's existing naming, selectors, data-source configuration, event handlers, validation, and styling conventions.
- Check whether the component is initialized from Razor, external JavaScript, or an existing shared helper before introducing a new pattern.

## Implementation guidance

- Keep component configuration explicit and consistent with existing code.
- Reuse DevExtreme data sources, stores, AJAX patterns, and server endpoints already used by the application where possible.
- Preserve existing form field names, IDs, model binding, validation behavior, and submission semantics. UI changes must not silently change backend contracts.
- For grids, forms, editors, popups, dropdowns, date controls, toolbars, and similar widgets, prefer the corresponding DevExtreme component when applicable.
- Keep event handlers small and consistent with existing project conventions; do not introduce a new front-end architecture for a localized change.
- Avoid mixing multiple UI libraries for equivalent components.
- Do not replace an existing DevExtreme component with a custom HTML/JavaScript implementation unless explicitly requested or required by a documented limitation.

## Validation and compatibility

- Pay particular attention to client-side validation, dynamic forms, disabled/read-only states, formatting, localization, and accessibility behavior.
- Verify that generated markup, element IDs, names, hidden fields, and serialized values remain compatible with Razor model binding and existing JavaScript.
- For changes to shared components or common JavaScript helpers, inspect all usages before changing behavior.

## Verification

For UI changes, verify at minimum:

1. The relevant Razor view renders without JavaScript errors.
2. The DevExtreme component initializes and receives the expected data.
3. Events and validation still behave as expected.
4. Form submission/model binding is unchanged unless intentionally modified.
5. Existing shared components or pages using the same helper/configuration are not regressed.

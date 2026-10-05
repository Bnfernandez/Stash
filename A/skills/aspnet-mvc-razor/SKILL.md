---
name: aspnet-mvc-razor
description: Use when changing Project A's ASP.NET MVC controllers, Razor views, model binding, validation, or request/response flow.
---

# ASP.NET MVC + Razor

- Inspect the controller, action, request model, view model, and Razor view together before changing a flow.
- Preserve route/action names, form field names, validation behavior, anti-forgery behavior, and model-binding expectations.
- Prefer existing service calls and view-model patterns.
- Avoid moving business logic between controller, service, and view merely for style.
- When changing a form, search for JavaScript, tests, integration consumers, and hard-coded field identifiers that depend on the rendered markup.
- Keep generated/compiled artifacts untouched.

## Verification

Build the web project and run focused tests. For form/view changes, verify the relevant endpoint and rendered markup expectations when tests exist.

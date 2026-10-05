---
name: sharepoint-powerautomate
description: Use when a Project B change affects data that is maintained by Power Automate flows writing to SharePoint lists.
---

# SharePoint + Power Automate contract

- Treat Power Automate as an external producer of list data.
- Before changing the API's interpretation of a field, inspect how the field is populated and what values/types the consuming code expects.
- Avoid silently changing field types, nullability, status vocabulary, or date/number formats.
- When a change requires a flow update, identify it explicitly rather than pretending the backend change is self-contained.
- Preserve compatibility with existing list items, including older values created before the new flow version.

---
name: sharepoint-csom
description: Use when changing Project B SharePoint Online integration using CSOM, including list retrieval, filtering, field mapping, pagination, authentication, or SharePoint-related failures.
---

# SharePoint Online CSOM

- Treat SharePoint list schema as an external contract. Inspect actual internal field names and existing mapping code before changing it.
- Keep SharePoint access behind the existing infrastructure/adapter boundary.
- Prefer retrieving only required fields and items. Preserve existing paging/filtering behavior.
- Consider throttling, transient failures, timeout, and cancellation.
- Do not log access tokens or full sensitive list payloads.
- Do not add write operations unless explicitly requested; current content changes are performed through Power Automate.

When a field is changed or renamed, assess both SharePoint internal-name compatibility and the API/BFF/frontend contract.

---
name: react-bff
description: Use when changing Project B React frontend, BFF endpoints, frontend API clients, backend-for-frontend contracts, or data flow between React, BFF, and API.
---

# React + BFF

Keep the flow explicit:

`React -> BFF -> API -> external system/data source`

- React should consume the BFF contract, not SharePoint or the internal API directly unless the repository explicitly establishes another route.
- Keep BFF logic focused on frontend-facing composition, translation, authorization context, and transport concerns.
- Do not duplicate domain rules in the BFF if the API/application layer owns them.
- When changing a response contract, update the BFF and React consumer together and inspect backward compatibility.
- Preserve loading, error, empty-state, and authentication behaviors in the UI.
- Follow existing React patterns for routing, state, hooks, API clients, and component boundaries.

---
name: sso-pkce
description: Use when changing Project B house SSO authentication, authorization-code flow, PKCE, callbacks, token handling, session behavior, or authorization checks.
---

# House SSO + PKCE

- Treat the authorization-code + PKCE flow as a security-sensitive contract.
- Preserve state, nonce, code verifier/challenge, redirect URI, token validation, issuer/audience checks, and expiration behavior established by the repository.
- Do not place client secrets in React or browser-delivered code.
- Do not log authorization codes, access tokens, refresh tokens, ID tokens, or sensitive claims.
- Inspect middleware/configuration and existing tests before modifying auth behavior.
- Add focused tests for success, invalid state/nonce, code exchange failure, expired/invalid token, and forbidden access where the existing test architecture supports them.

# 🚨 PROJECT CONTEXT — LEGACY ASP.NET RAZOR (.NET 8)

This is a LEGACY ASP.NET Core Razor Pages application.

The system must remain stable. All changes must be incremental and safe.

---

## 🧱 Architecture

- Razor Pages (UI + logic mixed)
- Partial Clean Architecture in Program.cs
- Services via Dependency Injection
- EF Core for data access
- AutoMapper for mapping

⚠️ This is NOT a strict Clean Architecture project.

---

## ⚙️ Tech Stack

- ASP.NET Core Razor Pages (.NET 8)
- Entity Framework Core
- Microsoft Identity
- AutoMapper
- Serilog
- DevExtreme
- Aspose
- LINQ

---

## 🚫 GLOBAL RULES

- Do NOT rewrite large parts of the application
- Do NOT introduce global architecture changes
- Do NOT break existing behavior
- Do NOT rename public APIs unless necessary

---

## 🧠 LEGACY MODE

- Prefer small, incremental changes
- Follow existing patterns
- Refactor ONLY touched code
- Never assume code is unused

---

## 🔄 MIGRATION MODE (.NET 10)

- Do NOT refactor during migration
- Only ensure compatibility
- Fix errors incrementally
- Preserve behavior strictly

---

## 🚀 MODERNIZATION MODE

- Improvements must be incremental
- No global refactor
- Use modern .NET features only when useful
- Maintain behavior

---

## 🧪 TESTING

- Add tests when modifying critical logic if possible
- Focus on preserving behavior

---

## 🧰 CODING RULES

- Use DI (no new static patterns)
- Prefer async/await
- Keep methods small
- Avoid deep nesting

---

## 🔐 SECURITY

- Respect Identity patterns
- Do not expose sensitive data

---

## 🤖 AGENT BEHAVIOR

1. Understand before modifying
2. Minimize impact
3. Keep consistency
4. Prefer safe improvements

---

## ⚠️ PRIORITY

Stability > Correctness > Modernity
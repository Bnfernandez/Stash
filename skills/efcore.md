# EF Core Skill

## When to use
- Database access
- Queries, updates, migrations

## Rules
- Use DbContext via DI only
- Do not write raw SQL unless necessary
- Use async methods (ToListAsync, FirstOrDefaultAsync)

## Performance
- Avoid N+1 queries
- Use Include() when needed
- Select only required fields

## Legacy constraint
- Do not change DbContext structure unless required
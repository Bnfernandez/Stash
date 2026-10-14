Je veux que tu construises une documentation technique et fonctionnelle fiable de cette application afin que tu puisses la comprendre et intervenir dessus correctement lors de futures sessions.

**Phase 1 — Analyse en lecture seule**

- Explore la structure du dépôt, les projets, les fichiers de configuration, les dépendances et les tests.
- Identifie l'architecture réelle et les responsabilités des principaux composants.
- Identifie les points d'entrée, les flux de données, les accès à la base, les appels aux API externes, l'authentification et les mécanismes de cache.
- Identifie les règles métier visibles dans le code et les dépendances entre les composants.
- Repère les zones sensibles, les contraintes de compatibilité et les risques de régression.

**Phase 2 — Documentation**

Propose une documentation organisée en fichiers Markdown :
- Vue d'ensemble et architecture.
- Structure du code et responsabilités des composants.
- Principaux flux métier, avec les fichiers et méthodes concernés.
- Modèle de données et interactions avec les systèmes externes.
- Règles métier, cas particuliers et gestion des erreurs.
- Contraintes techniques et décisions architecturales connues.

**Règles impératives**

- Ne modifie aucun code applicatif.
- Ne déduis pas une règle métier uniquement à partir d'un nom de classe ou de méthode.
- Distingue les faits vérifiés dans le code, les hypothèses et les questions nécessitant une confirmation humaine.
- Pour chaque flux documenté, indique les chemins des fichiers et les méthodes concernées.
- Ne reproduis aucun secret, jeton, mot de passe ou donnée personnelle.
- N'invente pas les raisons historiques des choix techniques.
- Évite de documenter chaque classe : privilégie les informations utiles pour comprendre et faire évoluer l'application.

Commence par me présenter l'architecture identifiée, les zones que tu as analysées et les principales incertitudes. Attends ma validation avant de créer ou modifier les fichiers de documentation.

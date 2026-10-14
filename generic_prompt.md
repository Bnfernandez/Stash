# User Story : [US-123 — Titre]

## Besoin

[Coller ici la description de l'US et le besoin utilisateur ou métier.]

## Critères d'acceptation

- [Critère 1]
- [Critère 2]
- [Critère 3]

## Contraintes spécifiques

- [Contraintes de compatibilité, sécurité, performance ou intégration.]
- Si aucune contrainte supplémentaire n'est indiquée, appliquer celles de `AGENTS.md`.

## Travail demandé

Prends en charge cette US en respectant les instructions du dépôt et la documentation existante.

### Étape 1 — Comprendre

- Consulte `AGENTS.md` et les documents pertinents.
- Retrouve dans le code le fonctionnement actuel concerné par l'US.
- Identifie les composants, dépendances, contrats et règles métier impactés.
- Vérifie les critères d'acceptation et repère les ambiguïtés.

### Étape 2 — Analyser l'impact

Avant de modifier le code, identifie :
- Les fichiers et composants probablement concernés.
- Le comportement actuel et le comportement attendu.
- Les risques de régression et les effets de bord.
- Les tests existants à adapter et les nouveaux tests nécessaires.
- Les éventuelles modifications de schéma, d'API ou de configuration.

Si une information essentielle manque ou si une décision métier est nécessaire, pose-moi une question avant de poursuivre.

### Étape 3 — Implémenter

Une fois l'analyse suffisamment claire :
- Implémente la solution la plus simple qui respecte les critères d'acceptation.
- Respecte l'architecture et les conventions existantes.
- Limite les modifications au périmètre nécessaire.
- N'introduis pas de changement de comportement non demandé.
- Ajoute ou adapte les tests pertinents.

Si un risque important ou une modification incompatible apparaît en cours de développement, arrête-toi et explique-moi le problème avant de poursuivre.

### Étape 4 — Vérifier

- Exécute les tests et vérifications pertinents.
- Vérifie chaque critère d'acceptation.
- Relis le diff complet.
- Signale les points non vérifiés et les risques résiduels.
- Mets à jour la documentation si le fonctionnement durable de l'application change.

### Compte rendu final

Présente :
1. Le comportement implémenté.
2. Les principaux fichiers modifiés et leur rôle.
3. La correspondance entre critères d'acceptation et tests.
4. Les commandes de vérification exécutées et leurs résultats.
5. Les éventuelles migrations, configurations ou actions de déploiement nécessaires.
6. Les points restant à valider.

Ne déclare pas l'US terminée si un critère important reste non vérifié.

##  Exercice 1

1 - Il manque l'identifier de la liste de string. En effet pour boucler sur la liste il a besoin d'une clé.

##  Exercice 2

La list a un bouton en plus et nous avons remplacer le debut de la liste par un forEach. Le forEach va permettre de boucler sur les items de la liste sans pour autant duppliquer le bouton.

##  Exercice 3

Le code ne fonctionne pas car par défault la variable loot est immuable. Pour cela, nous devons mettre le préfix @State pour signaler qu'en cas de changement la vue doit être détruite et reconstruite.

# Ajouter un item

## Exercice 1

Quand j'appuye sur le bouton ajouter il ne se passe rien. Cela est du au faite qu'il manque le préfix @ObservableObject ainsi que l'interface ObservableObject à la classe

## Exercice 2

L'ajout refonctionne car le fait d'avoir mis @StateObject permet de recharger la page au changement de l'objet (ce qui n'est pas le cas de @State, obj custom). Cette extension nécéssite d'ajouter l'interface ObservableObject à la classe. Pour finir pour s'assurer que la liste n'est créer q'une seul fois dans l'app nous rajoutons @Published.

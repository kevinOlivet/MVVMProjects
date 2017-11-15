# MVVMProjects
A collection of MVVM projects.

#UnitTestsPokemon

This project uses MVVM architecture to test Pokemon.
It started as a project to practice testing but grew into an example of MVVM architecture.

There is a model class Pokemon.
The logic and functions are implemented in PokemonViewModel.

The view is represented by the ViewController and it doesn't contain any logic except to import the viewModel.

Dividing the responsibilities this way helps avoid the "Massive ViewController" problem.
It also makes for easier testing.

This design pattern is similar to MVP except the ViewModel is ignorant of the View.

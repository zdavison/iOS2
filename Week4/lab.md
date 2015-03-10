iOS2.4
============

The goals of this lab are to design and implement a modular datasources that use different implementations for loading data.

- You should create a view controller with a tableview.
- You should have a field that can be used to input data.
- The tableview should have a 'viewModel' property which acts as the tableview's datasource.

After this, you should implement three different ViewModel classes:
- One that loads and saves data from NSUserDefaults
- One that loads and saves data to a file using NSFileManager
- One that loads and saves data using Core Data and NSFetchedResultsController

The goal is that the view controller does not need to know which viewModel type it is using, only that it 'provides data'.



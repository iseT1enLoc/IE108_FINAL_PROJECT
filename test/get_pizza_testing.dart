import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';

class MockPizzaRepo extends Mock implements PizzaRepo {}

main() {
  group('GetPizzaBloc', () {
    late MockPizzaRepo mock_pizza_repo;
    setUp(() {
      mock_pizza_repo = MockPizzaRepo();
    });
    blocTest<GetPizzaBloc, GetPizzaState>(
      'Initially nothing is called, emits []',
      build: () => GetPizzaBloc(mock_pizza_repo),
      expect: () => [],
    );
    blocTest<GetPizzaBloc, GetPizzaState>(
      'emits [GetPizzaLoading, GetPizzaSuccess] when GetPizza event is added and getPizzas succeeds',
      build: () {
        when(() => mock_pizza_repo.getPizzas()).thenAnswer((_) async => [
              Pizza.empty(),
              Pizza.empty(),
              Pizza.empty(),
              Pizza.empty(),
              Pizza.empty(),
              Pizza.empty()
            ]);
        return GetPizzaBloc(mock_pizza_repo);
      },
      act: (bloc) => bloc.add(GetPizza()),
      expect: () => [
        GetPizzaLoading(),
        // Verify that GetPizzaSuccess is emitted with the list of pizzas
        predicate(
            (state) => state is GetPizzaSuccess && state.pizzas.length == 6),
      ],
    );

    // Add another blocTest for error scenario
    blocTest<GetPizzaBloc, GetPizzaState>(
      'emits loading and failure states when GetPizza event is added and an error occurs',
      build: () => GetPizzaBloc(mock_pizza_repo),
      act: (bloc) => bloc.add(GetPizza()),
      setUp: () async {
        when() => mock_pizza_repo
            .getPizzas()
            .then((_) => throw Exception('Error fetching pizzas'));
      },
      expect: () => [
        GetPizzaLoading(),
        GetPizzaFailure(),
      ],
    );
  });
}

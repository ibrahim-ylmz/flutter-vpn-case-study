import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';

import 'connection_status_bloc_test.mocks.dart';

@GenerateMocks([VpnRepository])
void main() {
  group('ConnectionStatusBloc', () {
    late MockVpnRepository mockVpnRepository;
    late ConnectionStatusBloc connectionStatusBloc;

    setUp(() {
      mockVpnRepository = MockVpnRepository();
      when(mockVpnRepository.getCurrentStats()).thenReturn(
        const ConnectionStats(
          downloadSpeed: 0,
          uploadSpeed: 0,
          connectedTime: Duration.zero,
        ),
      );
      when(
        mockVpnRepository.getConnectionStatsStream(),
      ).thenAnswer((_) => const Stream.empty());

      connectionStatusBloc = ConnectionStatusBloc(mockVpnRepository);
    });

    tearDown(() {
      connectionStatusBloc.close();
    });

    test('initial state is ConnectionInitial', () {
      expect(connectionStatusBloc.state, const ConnectionInitial());
    });

    blocTest<ConnectionStatusBloc, ConnectionStatusState>(
      'emits [Disconnected] when InitializeConnectionStatusEvent is added and no country is connected',
      build: () => connectionStatusBloc,
      act: (bloc) => bloc.add(const InitializeConnectionStatusEvent()),
      expect: () => [const Disconnected()],
      verify: (_) {
        verify(mockVpnRepository.getCurrentStats()).called(1);
      },
    );
  });
}

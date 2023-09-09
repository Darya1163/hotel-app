import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels_app/bloc/room_reservation_bloc.dart';
import 'package:hotels_app/data/services/hotel_service.dart';
import 'bloc/hotel_bloc.dart';
import 'bloc/hotel_rooms_bloc.dart';
import 'presentation/hotel_screen.dart';
import 'repository/hotel_repository.dart';

GetIt getIt = GetIt.instance;

///Инициализируем внедрение зависимостей
void initGetIt() {
  getIt.registerLazySingleton<HotelService>(() => HotelService());
  getIt.registerLazySingleton<HotelRepository>(
      () => HotelRepository(hotelDataSource: getIt()));

  getIt.registerLazySingleton<HotelBloc>(
      () => HotelBloc(hotelRepository: getIt()));
  getIt.registerLazySingleton<RoomReservationBloc>(
      () => RoomReservationBloc(hotelRepository: getIt()));
}

void main() async {
  initGetIt();
  await dotenv.load();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<HotelBloc>()..add(HotelLoadEvent()),
        child: const HotelView(),
      ),
    );
  }
}

class HotelView extends StatelessWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel')),
      body: Center(
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelLoadedState) {
              return Text(state.hotel.name,
                  style: Theme.of(context).textTheme.displaySmall);
            }
            if (state is HotelErrorState) {
              return Text(
                state.message,
                style: Theme.of(context).textTheme.displaySmall,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var res = getIt<HotelRepository>()
//         .getHotel()
//         .then((v) => print("${v.name} name: 'MAIN-SUCCESS'"))
//         .catchError((err) => print("${err.toString()} name: 'MAIN-ERROR-'"));
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: "SF Pro Display",
//         useMaterial3: true,
//         textTheme: const TextTheme(
//           displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//         ),
//       ),
//       home: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => getIt<HotelBloc>()..add(HotelLoadEvent())),
//           BlocProvider(create: (context) => getIt<HotelRoomsBloc>()..add(HotelRoomsLoadEvent())),
//           BlocProvider(create: (context) => getIt<RoomReservationBloc>()..add(RoomReservationLoadEvent())),
//         ],
//         child: const HotelScreen(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hotels_app/bloc/hotel_rooms_bloc.dart';

// import 'hotel_screen.dart';
// import 'widgets/apartment/apartment_card.dart';
// import 'widgets/common/custom_appbar.dart';

// class ApartmentScreen extends StatelessWidget {
//   const ApartmentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       minimum: const EdgeInsets.only(top: 50),
//       child: Scaffold(
//         appBar: buildMainAppBar(
//           'Steigenberger Makadi',
//           IconButton(
//             icon: const Icon(
//               Icons.chevron_left,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const HotelScreen(),
//                 ),
//               );
//             },
//           ),
//         ),
//         body: Container(
//           color: const Color(0xffF6F6F9),
//           child: BlocBuilder<HotelRoomsBloc, HotelRoomsState>(
//               builder: (context, state) {
//             if (state is HotelRoomsLoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (state is HotelRoomsLoadedState) {
//               List<Widget> getList() {
//                 List<Widget> childs = [];
//                 for (var i = 0; i < state.hotelRooms.rooms.length; i++) {
//                   childs.add(Container(
//                     margin: const EdgeInsets.only(top: 8),
//                     child: ApartmentCard(
//                       // value: '${state.hotelRooms.rooms[i].price} ₽',
//                       // period: state.hotelRooms.rooms[i].pricePer,
//                       room: state.hotelRooms.rooms[i],
//                     ),
//                   ));
//                 }
//                 return childs;
//               }

//               return SingleChildScrollView(
//                 child: Table(
//                   border: TableBorder.all(color: Colors.transparent),
//                   children: state.hotelRooms.rooms.map((e) {
//                     return TableRow(
//                       children: getList(),
//                     );
//                   }).toList(),
//                 ),
//               );
//             }

//             if (state is HotelRoomsErrorState) {
//               return Center(
//                 child: Text(state.message.toString()),
//               );
//             }

//             return Container();
//           }),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/hotel_rooms_bloc/hotel_rooms_bloc.dart';
import 'package:hotels_app/main.dart';

import 'hotel_screen.dart';
import 'widgets/apartment/apartment_card.dart';
import 'widgets/common/custom_appbar.dart';

class ApartmentScreen extends StatelessWidget {
  const ApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50),
      child: BlocProvider(
          create: (context) =>
              getIt<HotelRoomsBloc>()..add(HotelRoomsLoadEvent()),
          child: Scaffold(
            appBar: buildMainAppBar(
              'Steigenberger Makadi',
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HotelScreen(),
                    ),
                  );
                },
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 8),
              color: const Color(0xffF6F6F9),
              child: Builder(builder: (context) {
                final stateRooms = context.watch<HotelRoomsBloc>().state;
                if (stateRooms is HotelRoomsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (stateRooms is HotelRoomsLoadedState) {
                  return SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(color: Colors.transparent),
                      children: stateRooms.hotelRooms.rooms.map((e) {
                        return TableRow(children: [ApartmentCard(room: e)]);
                      }).toList(),
                    ),
                  );
                }
                return Container();
              }),
            ),
          )),
    );
  }
}

import 'package:cab_booking_driver/components/colorset.dart';
import 'package:cab_booking_driver/widgets/appbar.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: aBar(
            ico: Icons.arrow_back_ios_new_rounded,
            icoColor: fontOnC,
            tIcoPre: true,
            title: "FAQ"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: Column(
              children: const[
                ExpansionTile(
                  title: Text("How many people can travel per cab?"),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text("Our seating configurations are listed when you are making a reservation. We typically list seating capacity as X +1 where X = number of passengers and the +1 is the chauffeur / driver"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text("When will I receive Driver & Cab details?"),
                  children: [
                    Text("We try to allocate the cab and driver as soon as possible. Please check your reservation confirmation email. In there you find a Live booking updates URL. As soon as your cab and driver are allocated, the details become visible there. In anycase, the details are made available to you well ahead of your time of travel"),
                  ],
                ),
                ExpansionTile(
                  title: Text("Do your cabs have Fast Tag so that we can move through the highway toll booths without having to stop?"),
                  children: [
                    Text("Many of our cabs are equipped with Fast tags but its not the case on all our cabs. Our cabs that ply on common highway routes tend to be equipped with Fast Tag but we cannot promise or commit to this being the case for all Gozo cabs"),
                  ],
                ),
                ExpansionTile(
                  title: Text("Does your app support in-app messaging between the customer and the driver."),
                  children: [
                    Text("Currently we do not support in-app messaging between the customer and the driver. We do have support for in app messaging between the driver and Gozo dispatch team but direct messaging between the customer and driver is not support. For our customers, who are traveling and have international phone numbers, you can always chat with our 24x7 support team via the gozo website and they can assist you with contacting your driver."),
                  ],
                ),
                ExpansionTile(
                  title: Text("Does the driver have GPS to track the route?"),
                  children: [
                    Text("Most of our drivers do use GPS to track the route but it is not implemented compulsorily. But customers can track their route through Google Map as we use that to track locations. Moreover, we have 24*7 customer service over web chat & call, customers can contact us for any doubts they have."),
                  ],
                ),
                ExpansionTile(
                  title: Text("Will the driver wait if the flight gets delayed or if I get late due to some unforseen circumstances after landing"),
                  children: [
                    Text("The driver will surely wait for you provided you have shared the flight number and arrival time in the booking so that the driver can monitor your flight arrival time. There are no waiting charges up to first 30 minutes after that per minute waiting charges as listed in your booking confirmation shall apply."),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}


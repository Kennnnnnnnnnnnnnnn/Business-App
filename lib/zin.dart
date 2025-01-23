                //  // signin 
                // ElevatedButton(
                //   onPressed: () async {
                //     if (emailController.text.isEmpty ||
                //         passController.text.isEmpty) {
                //       showError("Email or Password can not be empty");
                //       return;
                //     }
                //     User? user = await signIn();
                //     if (user == null) {
                //       showError("Incorrect email or password");
                //     } else {
                //       // Navigate to the new screen
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => Screen()),
                //       );
                //     }
                //   },
                //   style: ElevatedButton.styleFrom(
                //     foregroundColor: Colors.black,
                //     backgroundColor: const Color.fromARGB(255, 169, 96, 141),
                //   ),
                //   child: Text('Login'),
                // ),

          // Obx(() => GridView.builder(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         childAspectRatio: 0.9,
          //       ),
          //       itemCount: myState.products.length,
          //       itemBuilder: (context, index) {
          //         final product = myState.products[index];
          //         return Cards(
          //           name: product['name'] as String,
          //           price: '\$${product['price']}',
          //           iamge: product['image'] as String,
          //         );
          //       },
          //     )),
/*

Container(

            alignment: Alignment(0,-0.85),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                  dotWidth: (50)
              ),
            ),
          ),












Container(
                        child: TextButton(
                          onPressed: (){
                              print("Votre nom: "+widget.patient.nom);
                              print("Votre prenom: "+widget.patient.prenom);
                              print(widget.patient.dateNaissance);
                              print("Votre email: "+widget.patient.Email);
                          },
                          child: Text("click"),
                        ),
                      )

*/
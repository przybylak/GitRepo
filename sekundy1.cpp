#include <iostream>
using namespace std;
//wypisane po kolei liczba sekund w latach,miesiacach...
const int rok=60*60*24*7*4*12;
const int mie=60*60*24*7*4;
const int tyg=60*60*24*7;
const int dni=60*60*24;
const int godz=60*60;
const int minu=60;

int main()
{
    //wczytywanie liczby sekund
    int czas;
    cout << "Podaj liczbe sekund: ";
    cin >> czas;

    //wyliczanie wszystkich danych
    if(czas>=60) //sprawdzanie czy podana liczba sekund jest wieksza niz 60
        {

        cout<< "To "<<czas/rok<<" lat \n";
        czas%=rok;
        cout<< "To "<<czas/mie<<" miesiecy \n";
        czas%=mie;
        cout<< "To "<<czas/tyg<<" tygodni \n";
        czas%=tyg;
        cout<< "To "<<czas/dni<<" dni \n";
        czas%=dni;
        cout<< "To "<<czas/godz<<" godzin \n";
        czas%=godz;
        cout<< "To "<<czas/minu<<" minut \n";
        czas%=minu;
        cout<< "To "<<czas<<" sekund";

        }

    return 0;
}

#include <iostream>
#include <time.h>
#include <windows.h>

using namespace std;

void Sortowanie(int tab[], int size)
{
    int k;
    for(int i=0; i<size; i++)
    {
        k = i;
        for(int j = i+1; j<size; j++)
            if(tab[j] < tab[k])
                k=j;

        swap( tab[ k ], tab[ i ] );
    }
}

int main()
{
    int ile;
    cout<<"podaj ilosc losowych liczb w tablicy: ";
    cin>>ile;
    int *tablica;
    tablica=new int [ile];
    srand(time(NULL));
    cout<<"przed sorotwaniem"<<endl;
    for(int i=0; i<ile; i++)
    {
        tablica[i] = rand()%100000+1;
        cout<<tablica[i]<<" ";
    }

    Sortowanie(tablica, ile);

    cout<<endl<<"po sortowaniu"<<endl;
    for(int i=0; i<ile; i++)
    {
        cout<<tablica[i]<<" ";
    }

    delete [] tablica;
    return 0;
}

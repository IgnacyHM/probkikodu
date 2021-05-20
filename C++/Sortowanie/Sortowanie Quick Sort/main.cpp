#include <iostream>
#include <time.h>
#include <windows.h>

using namespace std;

void quicksort(int *tablica, int lewy, int prawy)
{
    int v=tablica[(lewy+prawy)/2];
    int i,j,x;
    i=lewy;
    j=prawy;
    do{
        while (tablica[i]<v) j++;
        while (tablica[j]>v) j--;
        if (i<=j) {
            x=tablica[i];
            tablica[i]=tablica[j];
            tablica[j]=x;
            i++; j--;
        }
    }while (i<=j);
    if (j>lewy) quicksort(tablica, lewy ,j);
    if (i<prawy) quicksort(tablica, i, prawy);
}

int main()
{
    int ile;
    cout<<"podaj ilosc losowych liczb w tablicy: ";
    cin>>ile;
    int *tablica2;
    tablica2=new int [ile];
    srand(time(NULL));
    cout<<"przed sorotwaniem"<<endl;
    for(int i=0; i<ile; i++)
    {
        tablica2[i] = rand()%100000+1;
        cout<<tablica2[i]<<" ";
    }

    quicksort(tablica2, 0, ile-1);

    cout<<endl<<"po sortowaniu"<<endl;
    for(int i=0; i<ile; i++)
    {
        cout<<tablica2[i]<<" ";
    }

    delete [] tablica2;
    return 0;
}

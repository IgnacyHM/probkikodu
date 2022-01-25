<?php
    $conn=mysqli_connect("localhost", "root", "", "baza");
    echo "Dodano rezerwację do bazy";
    $data=$_POST['data'];
    $li=$_POST['liczba'];
    $tel=$_POST['tel'];
    $zap="INSERT INTO rezerwacje (nr_stolika, data_rez, liczba_osob, telefon) VALUES (NULL, '$data', '$li', '$tel')";
    $qu=mysqli_query($conn,$zap);
    mysqli_close($conn);
?>
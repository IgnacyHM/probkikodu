<?php
    $conn=mysqli_connect('localhost', 'root', '', 'wedkowanie');
    $imie=$_POST['imie'];
    $nazwisko=$_POST['nazwisko'];
    $adres=$_POST['adres'];
    $zap="INSERT INTO kart_wedkarskie (imie, nazwisko, adres, data_zezwolenia, punkty) VALUES ('$imie', '$nazwisko', '$adres', NULL, NULL)";
    $qu=mysqli_query($conn, $zap);
    mysqli_close($conn);
?>
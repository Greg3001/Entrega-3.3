#include <stdio.h>
#include <stdlib.h>
#include <mysql.h>

int main() {
   
 //Creamos una conexion al servidor MYSQL 
 con = mysql_init(NULL);
 if (con==NULL) {
    printf ("Error al crear la conexi￳n: %u %s\n", 
        mysql_errno(con), mysql_error(con));
    exit (1);
 }
 //inicializar la conexin
 con = mysql_real_connect (con, "localhost","root", "mysql", "Jugadores",0, NULL, 0);
 if (con==NULL) {
    printf ("Error al inicializar la conexion: %u %s\n", 
        mysql_errno(con), mysql_error(con));
    exit (1);
 }

  // Añadir un jugador nuevo
  char query[255];
  printf(query, "INSERT INTO Jugadores (Nombre, Username, Contraseña) VALUES ('Patricia', 'Patricia123', 'ñlkjhgfdsa')");

  if (mysql_query(con, query) != 0) {
    printf("No se pudo añadir el jugador %s\n", mysql_error(con));
    mysql_close(con);
    exit(1);
  }
  
  printf("Jugador añadido correctamente!\n");

  // Consultar el ID del jugador
  char ConsultaID[255];
  printf(ConsultaID, "SELECT PlayerID FROM Jugadores WHERE Username = 'Patricia123'");

  MYSQL_RES *res = mysql_query(con, ConsultaID);
  if (res == NULL) {
    printf("No se pudo consultar el ID del jugador: %s\n", mysql_error(con));
    mysql_close(con);
    exit(1);
  }

  // Imprimir ID
  MYSQL_ROW row;
  while ((row = mysql_fetch_row(res))) {
    printf("%s\n", row[0]);
  }

  // Cerrar conexion
  mysql_free_result(res);
  mysql_close(con);

  return 0;
}

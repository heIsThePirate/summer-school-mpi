/****************************************************************
 *                                                              *
 * This file has been written as a sample solution to an        *
 * exercise in a course given at the CSCS Summer School.        *
 * The examples are based on the examples in the MPI course of  *
 * the Edinburgh Parallel Computing Centre (EPCC) and           *
 * the High Performance Computing Centre Stuttgart (HLRS).      *
 * It is made freely available with the understanding that      *
 * every copy of this file must include this header and that    *
 * CSCS, HLRS and EPCC take no responsibility for the use       *
 * of the enclosed teaching material.                           *
 *                                                              *
 * Authors: Joel Malard, Alan Simpson,            (EPCC)        *
 *          Rolf Rabenseifner, Traugott Streicher (HLRS)        *
 *          Maxime Martinasso (CSCS)                            *
 *                                                              *
 * Purpose: Parallel sum using a ping-pong                      *
 *                                                              *
 * Contents: C-Source                                           *
 *                                                              *
 ****************************************************************/


#include <stdio.h>
#include <mpi.h>


int main (int argc, char *argv[])
{
    int my_rank, size;
    int snd_buf, rcv_buf;
    int right, left;
    int sum, i;

    MPI_Status  status;
    MPI_Request request;


    MPI_Init(&argc, &argv);

    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    MPI_Comm_size(MPI_COMM_WORLD, &size);


    right = /* get rank of neighbor to your right */
    left  = /* get rank of neighbor to your left */

    /*Implement ring addition code */

    printf ("Process %i:\tSum = %i\n", my_rank, sum);

    MPI_Finalize();
}

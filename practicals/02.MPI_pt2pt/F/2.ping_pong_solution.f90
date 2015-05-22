PROGRAM ping_pong

!==============================================================!
!                                                              !
! This file has been written as a sample solution to an        !
! exercise in a course given at the CSCS Summer School.        !
! It is made freely available with the understanding that      !
! every copy of this file must include this header and that    !
! CSCS take no responsibility for the use of the enclosed      !
! teaching material.                                           !
!                                                              !
! Purpose: A program to try MPI_Ssend and MPI_Recv.            !
!                                                              !
! Contents: F-Source                                           !
!==============================================================!

! This code times the average time it takes for 2 processes to exchange a message

  USE MPI
  IMPLICIT NONE

  INTEGER PROCESS_A
  PARAMETER(PROCESS_A=0)

  INTEGER PROCESS_B
  PARAMETER(PROCESS_B=1)

  INTEGER PING
  PARAMETER(PING=17) ! message tag
  
  INTEGER PONG
  PARAMETER(PONG=23) ! message tag

  INTEGER NMESSAGES
  PARAMETER (NMESSAGES=100)

  INTEGER length
  PARAMETER (length=1)
 
  DOUBLE PRECISION tstart, tstop, time
  INTEGER status(MPI_STATUS_SIZE)
   
  REAL buffer(length)

  INTEGER i

  INTEGER ierror, my_rank, size

  CALL MPI_INIT(ierror)

  CALL MPI_COMM_RANK(MPI_COMM_WORLD, my_rank, ierror)

  tstart = MPI_WTIME()

  ! write a loop of number_of_messages iterations. Within the loop, process A sends a message
  ! (ping) to process B. After receiving the message, process B sends a message (pong) to process A) 

  DO i = 1, NMESSAGES

     IF (my_rank.EQ.PROCESS_A) THEN
        CALL MPI_SEND(buffer, length, MPI_REAL, PROCESS_B, PING, MPI_COMM_WORLD, ierror)
        CALL MPI_RECV(buffer, length, MPI_REAL, PROCESS_B, PONG, MPI_COMM_WORLD, status, ierror)
     ELSE IF (my_rank.EQ.PROCESS_B) THEN
        CALL MPI_RECV(buffer, length, MPI_REAL, PROCESS_A, PING, MPI_COMM_WORLD, status, ierror)
        CALL MPI_SEND(buffer, length, MPI_REAL, PROCESS_A, PONG, MPI_COMM_WORLD, ierror)
     END IF

  END DO

  tstop = MPI_WTIME()

  IF (my_rank.EQ.PROCESS_A) THEN
     time = tstop - tstart
     WRITE(*,*) 'Time for one message:', time/(2*NMESSAGES)*1e6, ' micro seconds'
  END IF

  CALL MPI_FINALIZE(ierror)

END PROGRAM

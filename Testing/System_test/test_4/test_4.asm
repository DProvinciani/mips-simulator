NOP ;
LB $1, 28($0);
LH $2, 28($0);
LW $3, 28($0);
LBU $4, 28($0);
LHU $5, 28($0);
LWU $6, 28($0);
SB $6, 32($0);
SH $6, 36($0);
SW $6, 40($0);
ADDI $10, $4, 2;
ANDI $11, $4, 129;
ORI $12, $4, 1;
XORI $13, $4, 129;
LUI $14, 1;
SLTI $15, $4, 129;
LW $7, 32($0);
LW $8, 36($0);
LW $9, 40($0);

module CAlab2FSM(i, clock, reset, f);
input clock;
input reset;
input i;
output reg f;

parameter s0 = 3'b000,
			s1 = 3'b001,
			s2 = 3'b010,
			s3 = 3'b011,
			s4 = 3'b100;
			
reg [2:0] CS, NS;

always @ (posedge clock)
begin
	if (reset == 1)
		CS <= s0;
	else
		CS <= NS;
end

always @ (CS, i)
begin
	case(CS)
	s0:begin
		if (i == 1)
			NS = s1;
		else 
			NS = s0;
	end
	
	s1:begin
		if (i == 1)
			NS = s1;
		else 
			NS = s2;
	end
	
	s2:begin
		if (i == 1)
			NS = s1;
		else 
			NS = s3;
	end
	
	s3:begin
		if (i == 1)
			NS = s4;
		else 
			NS = s0;
	end
	
	s4:begin
		if (i == 1)
			NS = s1;
		else 
			NS = s2;
	end
	
	default:NS = s0;
	endcase
f = (CS==s4)? 1:0;
end
endmodule

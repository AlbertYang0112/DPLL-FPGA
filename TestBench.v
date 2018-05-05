`timescale 1ns/1ps
module TestBench();
begin
    oscClk=0;
    forever #20 oscClk=~oscClk;
end
    
endmodule
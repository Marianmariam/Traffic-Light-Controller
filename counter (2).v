module counter (
	input clk,
	input rst,
	output reg [31:0] numar,
	output reg [31:0] count_sec,
	output reg impuls,
	output reg rosu,
	output reg verde,
	output reg galben,
	input switch,
	output reg led5,
	output reg leds,            // led secunde 1 secunda aprins 1 secunda stins
    output reg detect,
	output reg rosu_p,
	output reg verde_p,
	output reg schimb,
	output reg stins1

);
parameter t_verde = 3;
parameter t_galben = 6;
parameter t_rosu = 15;
parameter t_asteapta = 5;
parameter nrstop = 12000000; // 1 secunda



always @(posedge clk or negedge rst) begin // impuls da 1 secunda la clock
		if (~rst) begin
			numar <= 0;
			impuls <= 0;
		end else if (numar < nrstop) begin
			numar <= numar + 1; // numara pana la 12 mil
			impuls <= 0;
		end else begin
			numar <= 0;
			impuls <= 1;
		end 
	end

always @(posedge clk or negedge rst) begin 
    if(~rst) begin
        count_sec<= 0;
        leds <= 1;
    end else if (count_sec == t_rosu+t_verde+t_galben+t_asteapta) begin
        count_sec <= 0;
    end else if (impuls == 1 && schimb == 1) begin //schimb verifica schimbarea din 0 in 1
        count_sec <=count_sec+1 ;
        leds <= ~leds;
    end
end

always @(posedge clk or negedge rst) begin //detectie buton
    if(~rst) begin
      schimb <= 0;
    end else begin
      detect <= ~switch;    
      if (detect) begin
        schimb <= 1;  
      end
      if (count_sec == t_rosu+t_galben+t_verde+t_asteapta) begin
          schimb <= 0;
      end
    end
end

		// Control semafoare
		
always @(posedge clk or negedge rst) begin
	if(~rst) begin      // starea initiala --> semafor este verde
      verde <= 0;
      galben <= 1;
      rosu  <= 1;
      rosu_p <= 0;
      verde_p <= 1;
	  led5 <= 1;
	  stins1 <=1;
		end else if(schimb == 1)begin
		if (count_sec ==t_verde ) begin // Trecere la galben după 5 secunde pe verde
			rosu <= 1;    
			galben <= 0; 
			verde <= 1; 
			rosu_p <= 0;
			verde_p <= 1;
			
		end else if (count_sec == t_galben+t_verde) begin // Trecere la roșu după 2 secunde pe galben
			rosu <= 0;    
			galben <= 1; 
			verde <= 1; 
			rosu_p <= 1;
			verde_p <= 0;
			
		end else if (count_sec == t_rosu+t_galben+t_verde) begin // Trecere la verde după 7 secunde pe roșu
			rosu <= 1;    
			galben <= 1;  
			verde <= 0; 
			rosu_p <= 0;
			verde_p <= 1;
			
		end
	end
end

endmodule
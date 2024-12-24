
module led_water (
    input   clk,
    input   rst_n,
    output  reg [3:0]   led
);

    reg [27:0]  cnt;
    always @(posedge clk or negedge rst_n) begin
        if(rst_n==1'b0)
            cnt<=28'b0;
        else if(cnt==49_999_999)
            cnt<=28'b0;
        else
            cnt<=cnt+1'b1;
    end
    always @(posedge clk or negedge rst_n) begin
        if(rst_n==1'b0)
            led<=4'b0001;
        else if(cnt==49_999_999)
            led<={led[2:0],led[3]};
        else
            led<=led;
    end
        

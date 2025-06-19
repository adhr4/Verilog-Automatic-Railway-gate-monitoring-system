module tb_project();
    // Inputs
    reg clk;
    reg reset;
    reg SW1;

    // Outputs
    wire LED1;
    wire LED2;

    // Instantiate the DUT
    railway_gate_sim uut (
        .clk(clk),
        .reset(reset),
        .SW1(SW1),
        .LED1(LED1),
        .LED2(LED2)
    );

    // Clock generation: 10ns period = 100MHz
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        SW1 = 0;

        // Hold reset for a few cycles
        #20;
        reset = 0;

        // Simulate train signal ON
        #30;
        SW1 = 1;

        // Keep it ON for 200ns to simulate train approaching
        #200;
        SW1 = 0;

        // Let system continue for some time
        

        $finish; // Stop simulation
    end

endmodule


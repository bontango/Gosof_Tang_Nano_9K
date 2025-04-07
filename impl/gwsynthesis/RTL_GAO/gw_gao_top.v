module gw_gao(
    \SD_CARD/byte_count[9] ,
    \SD_CARD/byte_count[8] ,
    \SD_CARD/byte_count[7] ,
    \SD_CARD/byte_count[6] ,
    \SD_CARD/byte_count[5] ,
    \SD_CARD/byte_count[4] ,
    \SD_CARD/byte_count[3] ,
    \SD_CARD/byte_count[2] ,
    \SD_CARD/byte_count[1] ,
    \SD_CARD/byte_count[0] ,
    \SD_CARD/data_sd_card[7] ,
    \SD_CARD/data_sd_card[6] ,
    \SD_CARD/data_sd_card[5] ,
    \SD_CARD/data_sd_card[4] ,
    \SD_CARD/data_sd_card[3] ,
    \SD_CARD/data_sd_card[2] ,
    \SD_CARD/data_sd_card[1] ,
    \SD_CARD/data_sd_card[0] ,
    clk_27,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \SD_CARD/byte_count[9] ;
input \SD_CARD/byte_count[8] ;
input \SD_CARD/byte_count[7] ;
input \SD_CARD/byte_count[6] ;
input \SD_CARD/byte_count[5] ;
input \SD_CARD/byte_count[4] ;
input \SD_CARD/byte_count[3] ;
input \SD_CARD/byte_count[2] ;
input \SD_CARD/byte_count[1] ;
input \SD_CARD/byte_count[0] ;
input \SD_CARD/data_sd_card[7] ;
input \SD_CARD/data_sd_card[6] ;
input \SD_CARD/data_sd_card[5] ;
input \SD_CARD/data_sd_card[4] ;
input \SD_CARD/data_sd_card[3] ;
input \SD_CARD/data_sd_card[2] ;
input \SD_CARD/data_sd_card[1] ;
input \SD_CARD/data_sd_card[0] ;
input clk_27;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \SD_CARD/byte_count[9] ;
wire \SD_CARD/byte_count[8] ;
wire \SD_CARD/byte_count[7] ;
wire \SD_CARD/byte_count[6] ;
wire \SD_CARD/byte_count[5] ;
wire \SD_CARD/byte_count[4] ;
wire \SD_CARD/byte_count[3] ;
wire \SD_CARD/byte_count[2] ;
wire \SD_CARD/byte_count[1] ;
wire \SD_CARD/byte_count[0] ;
wire \SD_CARD/data_sd_card[7] ;
wire \SD_CARD/data_sd_card[6] ;
wire \SD_CARD/data_sd_card[5] ;
wire \SD_CARD/data_sd_card[4] ;
wire \SD_CARD/data_sd_card[3] ;
wire \SD_CARD/data_sd_card[2] ;
wire \SD_CARD/data_sd_card[1] ;
wire \SD_CARD/data_sd_card[0] ;
wire clk_27;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i({\SD_CARD/byte_count[9] ,\SD_CARD/byte_count[8] ,\SD_CARD/byte_count[7] ,\SD_CARD/byte_count[6] ,\SD_CARD/byte_count[5] ,\SD_CARD/byte_count[4] ,\SD_CARD/byte_count[3] ,\SD_CARD/byte_count[2] ,\SD_CARD/byte_count[1] ,\SD_CARD/byte_count[0] }),
    .data_i({\SD_CARD/byte_count[9] ,\SD_CARD/byte_count[8] ,\SD_CARD/byte_count[7] ,\SD_CARD/byte_count[6] ,\SD_CARD/byte_count[5] ,\SD_CARD/byte_count[4] ,\SD_CARD/byte_count[3] ,\SD_CARD/byte_count[2] ,\SD_CARD/byte_count[1] ,\SD_CARD/byte_count[0] ,\SD_CARD/data_sd_card[7] ,\SD_CARD/data_sd_card[6] ,\SD_CARD/data_sd_card[5] ,\SD_CARD/data_sd_card[4] ,\SD_CARD/data_sd_card[3] ,\SD_CARD/data_sd_card[2] ,\SD_CARD/data_sd_card[1] ,\SD_CARD/data_sd_card[0] }),
    .clk_i(clk_27)
);

endmodule

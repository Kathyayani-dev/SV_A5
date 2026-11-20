# code 1  // q1.sv
...
module assign1();

        int d,result;
        int a=2, b=3;

        function automatic mult(input int a, input int b, output int c);
                c=(a*b)+2;
                $display("Inside function time:%0d a:%0d b:%0d c:%0d", $time,a,b,c);
        endfunction

        initial
        fork
                begin
                        #1;
                        mult(2,3,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);
                end
                begin
                        #2;
                        mult(2,4,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);

                end
        join

endmodule
...


# code 2
...
module assign2();

        int d,result;
        int a=2, b=3;

        task mult(input int a, input int b, output int c);
                #5;
                c=(a*b)+2;
                a++;
                $display("Inside function time:%0d a:%0d b:%0d c:%0d", $time,a,b,c);
        endtask

        initial
        fork
                begin
                        #1;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);
                end
                begin
                        #2;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);

                end
        join

endmodule
...


# code 3
...
module assign3();

        int d,result;
        int a=2, b=3;

        function mult(input int a, input int b, output int c);
                c=(a*b)+2;
                a++;
                $display("Inside function time:%0d a:%0d b:%0d c:%0d", $time,a,b,c);
        endfunction

        initial
        fork
                begin
                        #1;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);
                end
                begin
                        #2;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);

                end
        join

endmodule
...


# code 4
...
module assign4();

        int d,result;
        int a=2, b=3;

        task automatic mult (input int a,input int b, output int c);
                #5;
                c=(a*b)+2;
                a++;
                $display("Inside function time:%0d a:%0d b:%0d c:%0d", $time,a,b,c);
        endtask

        initial
        fork
                begin
                        #1;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);
                end
                begin
                        #2;
                        mult(a,b,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);

                end
        join

endmodule
...


# code 5
...
module assign5();

        int d,result;
        int a=2, b=3;

        task automatic mult (input int a,input int b, output int c);
                #5;
                c=(a*b)+2;
                a++;
                $display("Inside function time:%0d a:%0d b:%0d c:%0d", $time,a,b,c);
        endtask

        initial
        fork
                begin
                        #1;
                        mult(2,3,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);
                end
                begin
                        #2;
                        mult(2,4,d);
                        $display("Outside function time:%0d a:%0d b:%0d d:%0d", $time,a,b,d);

                end
        join

endmodule
...


# code 6
...
class pass_by_ref;

        int refr=2;
        int val=2;

        function automatic int check_refer(ref int r);
                $display("Initial value of refr=%0d", r);
                r++;
                $display("Value of REFR after incrementing %0d",r);
        endfunction

        function automatic int check_val(int v);
                $display("Initial value of val=%0d", v);
                v++;
                $display("Value of VAL after incrementing %0d",v);
        endfunction


endclass

pass_by_ref h1;

module assign6();

        initial
        begin
                h1=new();
                h1.check_refer(h1.refr);
                h1.check_val(h1.val);
                $display("Value of REFR after incrementing: %0d", h1.refr);
                $display("Value of VAL after incrementing : %0d",h1.val);
        end

endmodule
...


# code 7
...
odule assign7();
        task dummy_task(input int x, string str);
                fork
                        begin
                                #x;
                        end
                        begin
                                #10;
                        end
                join_any //if any thread is completed, compiler doesn't wait for other process to be complete

                //disable fork;
                $display("%s is disabled at t = %t",str,$time);
        endtask

        initial
                fork
                        begin
                                #2;
                                dummy_task (5, "call_1");
                        end
                        begin
                                #1;
                                dummy_task (15, "call_2");
                        end
                join
endmodule
...

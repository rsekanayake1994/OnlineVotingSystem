


//document.getElementById("playFancy").onclick = function() {myFunction()};

/*function myFunction() {
	 
}
*/
//document.getElementById("tsend").onclick = function() {myFunction()};

//function myFunction2() {
//	 $('.slot').jSlots({
//	    	number : 10,
//	        spinner:'#tsend',
//	        onStart:getNewNumber1
//	    });
//}

(function ($) {
	/*$('#playFancy').click(function()	{
		$('.slot').jSlots();
	});
	$('.slot').jSlots(
			{

				number : 10,
				spinner : '#playFancy',

				endNumbers : [1,8,8,5,4,6,3,7,4,1

	]
			//set last numbers 
	});
	*/
	
	
	
	
	//alert("2");
    $.jSlots = function (el, options) {//2
    	//alert("2");
        var base = this;
      //  alert("12"+JSON.stringify(options));
       
        base.$el = $(el);
        base.el = el;

        base.$el.data("jSlots", base);

        base.init = function () {//3
//alert("3");
            base.options = $.extend({}, $.jSlots.defaultOptions, options);

            base.setup();
            base.bindEvents();

        };


        // --------------------------------------------------------------------- //
        // DEFAULT OPTIONS
        // --------------------------------------------------------------------- //

        $.jSlots.defaultOptions = {//4
        		
            number: 3, // Number: number of slots
            winnerNumber: 1, // Number or Array: list item number(s) upon which to trigger a win, 1-based index, NOT ZERO-BASED
            spinner: '', // CSS Selector: element to bind the start event to
            spinEvent: 'click', // String: event to start slots on this event
            onStart: $.noop, // Function: runs on spin start,
            onEnd: $.noop, // Function: run on spin end. It is passed (finalNumbers:Array). finalNumbers gives the index of the li each slot stopped on in order.
            onWin: $.noop, // Function: run on winning number. It is passed (winCount:Number, winners:Array)
            easing: 'swing', // String: easing type for final spin
            time: 7000, // Number: total time of spin animation
            loops: 6, // Number: times it will spin during the animation
            endNumbers: [] // *ADDED* Array: list an array matching the number of slots. Pass empty array for random results.
        };

        // --------------------------------------------------------------------- //
        // HELPERS
        // --------------------------------------------------------------------- //

        base.randomRange = function (low, high) {
        	//alert("notrun_2");
            return Math.floor(Math.random() * (1 + high - low)) + low;
        };

        // --------------------------------------------------------------------- //
        // VARS
        // --------------------------------------------------------------------- //

        base.isSpinning = false;
        base.spinSpeed = 0;
        base.winCount = 0;
        base.doneCount = 0;

        base.$liHeight = 0;
        base.$liWidth = 0;

        base.winners = [];
        base.allSlots = [];

        // --------------------------------------------------------------------- //
        // FUNCTIONS
        // --------------------------------------------------------------------- //


        base.setup = function () {//5
        //	alert("5");
            // set sizes

            var $list = base.$el;
            var $li = $list.find('li').first();

            base.$liHeight = $li.outerHeight();
            base.$liWidth = $li.outerWidth();

            base.liCount = base.$el.children().length;

            base.listHeight = base.$liHeight * base.liCount;

            base.increment = (base.options.time / base.options.loops) / base.options.loops;

            $list.css('position', 'relative');

            $li.clone().appendTo($list);

            base.$wrapper = $list.wrap('<div class="jSlots-wrapper"></div>').parent();

            // remove original, so it can be recreated as a Slot
            base.$el.remove();

            // clone lists
            for (var i = base.options.number - 1; i >= 0; i--) {
                base.allSlots.push(new base.Slot());
            }

        };

        base.bindEvents = function () {//7
       // 	alert("7");
            $(base.options.spinner).bind(base.options.spinEvent, function (event) {
                if (!base.isSpinning) {
                    base.playSlots();
                }
            });
        };

        // Slot contstructor
        base.Slot = function () {//6
        	//alert("6");
            this.spinSpeed = 0;
            this.el = base.$el.clone().appendTo(base.$wrapper)[0];
            this.$el = $(this.el);
            this.loopCount = 0;
            this.number = 0;

        };


        base.Slot.prototype = {

            // do one rotation
            spinEm: function () {//9
            	//alert("9");
                var that = this;

                that.$el.css('top', -base.listHeight)
                    .animate({
                    'top': '0px'
                }, that.spinSpeed, 'linear', function () {
                    that.lowerSpeed();
                });

            },

            lowerSpeed: function () {//10
           // 	alert("10");
                this.spinSpeed += base.increment;
                this.loopCount++;

                if (this.loopCount < base.options.loops) {
//alert("count:"+this.loopCount);//1,2,3
                    this.spinEm();

                } else {

                    this.finish();

                }
            },

            // final rotation <--- Key
            finish: function () {//11
           // 	alert("11");
            	
                var that = this;
            //   alert("ee"+el);
          //    alert([base.allSlots.indexOf(this)]);
               // Checks if endNumbers array length is greater than 0. If not selects a random number.
                var endNum;
                
                if (base.options.endNumbers.length > 0) {
                    endNum = base.options.endNumbers[base.allSlots.indexOf(this)];
                    
                } else {
                    endNum = base.randomRange(1, base.liCount);
                }

               /* document.getElementById("demo").innerHTML = "Paragraph changed!";*/

                var finalSpeed="";
                var finalPos = -((base.$liHeight * endNum) - base.$liHeight);
           //     alert("ddddd"+endNum);
          if([base.allSlots.indexOf(this)]==0|| endNum==1){
        	  
        	   finalSpeed=500;
           }
          else if([base.allSlots.indexOf(this)]==1){
        	  
        	
        	   finalSpeed=500;
           }
          else if([base.allSlots.indexOf(this)]==2){
        	  
          	
       	  // finalSpeed=12000;
       	   	finalSpeed=500;
          }
          else if([base.allSlots.indexOf(this)]==8){
        	  
          	// finalSpeed=12000;
       	   finalSpeed=500;
          } 
           else{
              //  alert("rr"+endNum);
                 finalSpeed = (((this.spinSpeed * 0.5) * (base.liCount)) / endNum)-500;
                
             
           }
       //  alert("eee"+finalSpeed);   
          that.$el.css('top', -base.listHeight)
                    .animate({
                    'top': finalPos
                }, finalSpeed, base.options.easing, function () {
                    base.checkWinner(endNum, that);
                    
                });

            }
            
        };

        base.checkWinner = function (endNum, slot) {//12
        //	alert("12");
        	
            base.doneCount++;
            // set the slot number to whatever it ended on
            slot.number = endNum;

            // if its in the winners array
            if (
            ($.isArray(base.options.winnerNumber) && base.options.winnerNumber.indexOf(endNum) > -1) || endNum === base.options.winnerNumber) {

                // its a winner!
                base.winCount++;
                base.winners.push(slot.$el);

            }

            if (base.doneCount === base.options.number) {

                var finalNumbers = [];

                $.each(base.allSlots, function (index, val) {
                    finalNumbers[index] = val.number;
                });

                if ($.isFunction(base.options.onEnd)) {
                    base.options.onEnd(finalNumbers);
                }

                if (base.winCount && $.isFunction(base.options.onWin)) {
                    base.options.onWin(base.winCount, base.winners, finalNumbers);
                }
                base.isSpinning = false;
             /*   $('.playFancy').on('click',function() {*/
                    $('#playFancy').prop("disabled",true);
               /* });*/
                    $('#one').prop("disabled",false);
                    $('#two').prop("disabled",false);
             /* num=   $("#test").val() ; 
                $.ajax({
        	        url: 'test_1.jsp?action=store_winner&win='+num,
        	        contentType: 'application/json',
        	        context: document.body
        	    }).done(function (response) {
        	          // alert(response);
        	           obj = JSON.parse(response.trim());
           			//alert("response"+obj.countListByDate[0]);
        	            document.getElementById("total-summery-missed-calls").innerHTML="Missed Calls: <br><font size='2' style='font-weight: 900' color='#000000'>"+obj.countListByDate[0]+"</font>";
        	            document.getElementById("total-summery-voice").innerHTML="Voice Engagement: <br><font size='2' style='font-weight: 900' color='#000000'>"+obj.countListByDate[1]+"</font>";
        	            document.getElementById("total-summery-sms").innerHTML="SMS Engagement:<br><font size='2' style='font-weight: 900' color='#000000'>"+obj.countListByDate[1]+"</font>";
        	           // document.getElementById("total-summery-max-info").innerHTML="SMS-More Info: <br><font size='2' style='font-weight: 900' color='#000000'>"+obj.countListByDate[3]+"</font>";
        	           // document.getElementById("total-summery-max-try").innerHTML="SMS-Max Try:<br><font size='2' style='font-weight: 900' color='#000000'>"+obj.countListByDate[4]+"</font>";


        	        });   */
                
               
            }
        };


        base.playSlots = function () {//8
        //	alert("8");
            base.isSpinning = true;
            base.winCount = 0;
            base.doneCount = 0;
            base.winners = [];

            if ($.isFunction(base.options.onStart)) {
                base.options.onStart(base);
            }

            $.each(base.allSlots, function (index, val) {
                this.spinSpeed = 0;
                this.loopCount = 0;
                this.spinEm();
            });

        };


        base.onWin = function () {
        //	alert("not run");
            if ($.isFunction(base.options.onWin)) {
                base.options.onWin();
            }
        };


        // Run initializer
        base.init();
    };


    // --------------------------------------------------------------------- //
    // JQUERY FN
    // --------------------------------------------------------------------- //

    $.fn.jSlots = function (options) {//1
    //	alert("hellooo");
   //alert("1"+JSON.stringify(options));//{"number":10,"spinner":"#playfancy","endnumbers":[1,8,8,5,4,6,3,7,4,1] }
   
        if (this.length) {
      // 	alert("option"+this.length);//1
            return this.each(function () {
                (new $.jSlots(this, options));
            });
        }
    };

})(window.jQuery);

var getNewNumber=function(spinner){
	//alert("inside getNewNumber");
	 var  num1=   $("#myselect").val() ; //boc ,TVS ITEL
	 var  num2=   $("#test").val() ; //Campaign ID
	 var  date_1=   $("#timepicker_from_date").val() ;
	 var  date_2=   $("#timepicker_to_date").val() ;
	 var  matchId=   $("#matchIDSel").val() ;
	 var description =$('#description1').val();
	 var  matchType="";  
	// alert("date_1 ::"+date_1);
	 //alert("date_2 :"+date_2);
	 
	 if(document.getElementById('matchIDSel').disabled==false && matchId=='0' ){
		 alert("Please select the Match Name");
		 return;
	 }
	
	 /* var event = jQuery("#event_id_from_list").val(); 
      var data = "event_id=" + event;*/
	 if (document.getElementById('matchIDSel').disabled==false ) {//match date
		 matchType="MDATE";
	 }else if( document.getElementById('timepicker_from_date').disabled==false){ //date range
		 matchType="DATER";
	 }
	// alert("matchType :"+matchType);
	 
    $.ajax({

     //   url: 'DashboardController_surf.jsp?action=getSMSSummeryDate&date_time='+today+"&number=",
     //   "&number="+numberListByDate,
       url:"test_1.jsp?action=check&num1="+num1+"&num2="+num2+"&date_1="+date_1+"&date_2="+date_2+"&matchId="+matchId+"&matchType="+matchType+"&description="+description,
        method:"POST",
        async:false,
        
      /*  data:{}*/
    })
            .done(function(response){
            	//alert(response);
               // obj = JSON.parse(response.trim());
                var num=response.toString().split(",");
                
                if(response){
                	//alert("received message:"+num[10]);
                	//spinner.options.endNumbers=[1,8,8,5,4,6,3,7,4,1];
                	if(num[1]=='1' && num[2]=='1' && num[3]=='1' && num[4]=='1' && num[5]=='1' && num[6]=='1'){
                		//alert("if num 0");
                		document.getElementById("winnerNotification").style.display = "block";
                	}else{
                		document.getElementById("winnerNotification").style.display = "none";
                	}
                   spinner.options.endNumbers=[num[0],num[1],num[2],num[3],num[4],num[5],num[6],num[7],num[8],num[9]];
                    //console.log(data);
                }
            });
};


 
$('.slot').jSlots({
	number : 10,
    spinner:'#playFancy',
    onStart:getNewNumber
});



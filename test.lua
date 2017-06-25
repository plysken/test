<head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:light,regular,medium,thin,italic,mediumitalic,bold" title="roboto">
	<script src="nui://game/ui/jquery.js" type="text/javascript"></script>
	<script>
		function addCommas(nStr) {
			nStr += '';
			var x = nStr.split('.');
			var x1 = x[0];
			var x2 = x.length > 1 ? '.' + x[1] : '';
			var rgx = /(\d+)(\d{3})/;
			while (rgx.test(x1)) {
				x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
			}
			return x1 + x2;
		}

		var moneyIcon = "$"

		window.onload = function(e){
			// NUI Callback
			window.addEventListener('message', function(event){
				var item = event.data;

				if(item.seticon == true)
					moneyIcon = item.icon;
				if(item.setmoney == true)
					document.getElementById("cash").innerHTML = "<div><font style='color: rgb(0, 125, 0); font-weight: 700; margin-right: 6px;'>" + moneyIcon + "</font>" + addCommas(item.money);
				if(item.setDirty_money == true)
					document.getElementById("dirty_cash").innerHTML = "<div><font style='color: rgb(125, 0, 0); font-weight: 700; margin-right: 6px;'>" + moneyIcon + "</font>" + addCommas(item.dirty_money);
				if(item.addcash == true){
					$(".tiny").remove();

					var element = $("<div class='tiny'>+<font style='color: rgb(0, 125, 0); font-weight: 700; margin-right: 6px;'>" + moneyIcon + "</font>"+addCommas(item.money)+"</div>")
					$("#money").append(element)

					setTimeout(function(){
						$(element).fadeOut(600, function() { $(this).remove(); })
					}, 1000)
				}
				if(item.removecash == true){
					$(".tiny").remove();
					
					var element = $("<div class='tiny'>-<font style='color: rgb(250, 0, 0); font-weight: 700; margin-right: 6px;'>" + moneyIcon + "</font>"+addCommas(item.money)+"</div>")
					$("#money").append(element)

					setTimeout(function(){
						$(element).fadeOut(600, function() { $(this).remove(); })
					}, 1000)
				}
				if(item.removeStartWindow == true){
					$("#starter").remove();
				}
				if(item.setDisplay == true){
					$("#money").css('opacity', item.display)
					$("#dirty_money").css('opacity', item.display)
				}
			})
		}
	</script>

	<style>
		@font-face {
			font-family: pcdown;
			src: url(pdown.ttf);
		}
		.tiny {
			font-size: 29px;
			position: absolute; right: 10;
		}
		#money {
			font-family: pcdown;
			font-size: 35px;
			color: white;
			padding: 4px;
		text-shadow:
		   -1px -1px 0 #000,
			1px -1px 0 #000,
			-1px 1px 0 #000,
			 1px 1px 0 #000;
				}

		#container {
			position: absolute;
			top: 40; right: 40;
		}
	</style>
</head>

<body>
	<div id="starter" style="font-family: 'roboto'; color: white; position: absolute; left: 20%; top: 5%; width: 60%; background: rgba(40, 40, 40, 0.8)">

	</div>
	<div id="container">
		<div id="money">

			<div id="cash"/>
		</div>
		<div id="dirty_money"/>
			<div id="dirty_cash"/>
		</div>
	</div>
</body>

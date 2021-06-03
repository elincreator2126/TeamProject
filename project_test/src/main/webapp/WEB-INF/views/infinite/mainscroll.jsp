<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="author"/>
 <meta name="viewport" content="width=device-width">
 <title>Infinite Scroll</title>
 <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
})//document ready end

function signup_mainscroll(){
	location.href = "/mainscroll"
};//document ready end
</script>
  <style>
html {
  	  background-color: rgba(244,238,238,1);
}

html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
      overflow: hidden;
      -webkit-tap-highlight-color: rgba(0,0,0,0);
}
    #templates {
	position: inherit;
    width: 1920px;
    height: 0px;
    background-color: rgba(244,238,238,1);
    overflow: hidden;
    --web-scale-on-resize: true;
    --web-enable-deep-linking: true;
}
  </style>
<link href='styles/messages.css' rel='stylesheet' type='text/css'>
</head>
<body>
<div id="templates">
<div id= mainBarBox>
<div class= mainBarBox>
	<svg class="topbar1">
		<rect id="topbar1" rx="0" ry="0" x="0" y="0" width="100%" height="130px">
		</rect>
	</svg>
</div>
<div id= mainBarBox2>
	<div class= mainBarBox2>
		<div class="titleHH" >
		</div>
	</div>
</div>
	<div id="iconPBox">
	<div id="searchIconBox">
	<svg class="searchIcon"  viewBox="160.5 482.975 50 50">
		<path id="searchIcon" d="M 194.1509 507.6557 L 191.1825 510.6247 L 187.2684 506.7124 C 189.1769 504.1599 190.2239 501.0822 190.2239 497.8383 C 190.2239 493.8687 188.6769 490.1354 185.8699 487.3281 C 183.0615 484.5209 179.3303 482.9749 175.3619 482.9749 C 171.3922 482.9749 167.661 484.5209 164.854 487.3281 C 162.047 490.1354 160.5 493.8687 160.5 497.8383 C 160.5 501.8093 162.047 505.5442 164.854 508.3529 C 167.661 511.16 171.3922 512.7061 175.3619 512.7061 C 178.6061 512.7061 181.683 511.6567 184.2357 509.7457 L 188.1484 513.658 L 185.1799 516.627 L 201.529 532.975 L 210.5 524.0036 L 194.1509 507.6557 Z M 167.8810 505.3137 C 165.8854 503.3153 164.7854 500.6627 164.7854 497.8398 C 164.7854 495.0169 165.8854 492.3642 167.8810 490.3673 C 169.8794 488.3703 172.5364 487.2695 175.3619 487.2695 C 178.1875 487.2695 180.8445 488.3703 182.8430 490.3673 C 184.8385 492.3642 185.9385 495.0169 185.9385 497.8398 C 185.9385 500.6627 184.8400 503.3153 182.8430 505.3137 C 180.8445 507.3107 178.1875 508.4115 175.3619 508.4115 C 172.5364 508.4115 169.8794 507.3107 167.8810 505.3137 Z M 192.4924 517.8724 L 195.3908 514.9622 L 204.4331 524.0036 L 201.5290 526.9081 L 192.4924 517.8724 Z">
		</path>
	</svg>
	</div>
		<div id="loginIconBox">
			<svg class="loginIcon" viewBox="2 2 20 20">
				<path id="loginIcon" d="M 12 2 C 6.48 2 2 6.48 2 12 C 2 17.52 6.48 22 12 22 C 17.52 22 22 17.52 22 12 C 22 6.479999 17.52 2 12 2 Z M 12 5 C 13.65999 5 15 6.34 15 8 C 15 9.66 13.66 11 12 11 C 10.34 11 9 9.66 9 8 C 9 6.34 10.34 5 12 5 Z M 12 19.2 C 9.5 19.2 7.29 17.92 6 15.98 C 6.03 13.99 10 12.9 12 12.9 C 13.99 12.9 17.97 13.99 18 15.98 C 16.71 17.92 14.5 19.2 12 19.2  Z">
				</path>
			</svg>
		</div>
	<div id="langueIconBox">
		<svg class="langueIcon" viewBox="500.5 962.94 50 50">
			<path id="langueIcon" d="M 550.4571 986.3828 C 550.4142 985.6257 550.3286 984.8686 550.1857 984.0400 C 549.8143 981.5686 549.0427 979.1257 547.8856 976.8256 C 543.6571 968.2686 535.0714 962.9400 525.5 962.9400 C 519.5857 962.9400 513.8571 965.0400 509.3571 968.8543 C 507.7570 970.1972 506.3571 971.7114 505.1713 973.3685 C 503.3286 975.9257 501.9857 978.8256 501.2285 981.9399 C 500.7428 983.8829 500.5 985.8972 500.5 987.9399 C 500.5 990.1685 500.7857 992.3256 501.3427 994.3829 C 502 996.8542 503.0285 999.1685 504.3713 1001.282 C 506.5142 1004.668 509.4570 1007.511 512.9285 1009.539 C 516.6286 1011.697 520.9285 1012.940 525.5 1012.940 C 526.6428 1012.940 527.7572 1012.868 528.8571 1012.711 C 533.0286 1012.168 536.8714 1010.597 540.1141 1008.268 C 546.1713 1003.925 550.1857 996.9113 550.4857 988.8686 C 550.5 988.5828 550.5 988.2685 550.5 987.9399 C 550.5 987.4113 550.4857 986.8972 550.4571 986.3828 Z M 544.4428 982.0686 C 544.5857 981.8970 545.0714 981.9543 545.5142 982.1971 C 545.6286 982.2685 545.7284 982.2828 545.8142 982.2828 C 546.0285 983.0543 546.2142 983.8543 546.3286 984.6685 C 546.3571 984.7829 546.3571 984.8828 546.3713 984.9971 C 546.2142 984.6114 545.9714 984.2399 545.7142 983.9686 L 545.0141 983.2542 C 544.5571 982.7828 544.2999 982.2542 544.4428 982.0686 Z M 546.5856 988.7258 C 546.4856 991.6829 545.7713 994.4686 544.5714 996.9829 C 542.9285 1000.411 540.4143 1003.325 537.2857 1005.425 C 536.3999 1006.039 535.4857 1006.568 534.5143 1007.025 L 534.5 1007.025 C 533.8428 1007.339 533.1713 1007.611 532.4857 1007.854 C 531.5429 1008.182 530.5714 1008.454 529.5714 1008.640 C 529.2429 1008.711 528.9142 1008.768 528.5857 1008.811 C 527.5714 1008.968 526.5427 1009.040 525.5 1009.040 C 521.0571 1009.040 516.9285 1007.668 513.5285 1005.311 C 510.7999 1003.425 508.5285 1000.897 506.9285 997.9686 C 506.4572 997.0970 506.0428 996.1970 505.7142 995.2542 L 505.7000 995.2542 C 504.8570 992.9685 504.4000 990.5114 504.4000 987.9399 C 504.4000 986.7972 504.5285 985.6828 504.7000 984.5828 C 504.7285 984.6971 504.7427 984.8258 504.7713 984.9257 L 505.5428 987.3543 C 505.7429 987.9827 506.4428 988.5828 507.0999 988.6829 L 510.7000 989.2399 C 511.3142 989.3256 511.9570 989.8543 512.1999 990.4400 C 512.2285 990.4827 512.2428 990.5400 512.2571 990.5827 L 512.5856 991.6829 C 512.7857 992.3115 512.5142 993.1542 511.9714 993.5399 L 511.2142 994.0971 C 510.6856 994.4829 510.1142 995.3256 509.9570 995.9685 L 509.5855 997.4685 L 509.3999 998.2114 C 509.2427 998.8543 509.5855 999.6400 510.1571 999.9542 C 510.7428 1000.268 511.7570 1000.611 512.3999 1000.725 L 512.4284 1000.725 C 513.0714 1000.839 513.8571 1001.325 514.1713 1001.782 C 514.1999 1001.825 514.2427 1001.882 514.2714 1001.940 C 514.5856 1002.425 515.0142 1003.168 515.2713 1003.711 L 516.4000 1005.939 C 516.6856 1006.540 517.4285 1007.025 518.0430 1007.025 C 518.6429 1007.025 519.0570 1006.482 518.9572 1005.825 L 518.4285 1002.454 C 518.3286 1001.797 518.5285 1000.797 518.8713 1000.225 L 519.4572 999.2543 C 519.8142 998.6828 520.0572 997.6828 520.0286 997.0114 L 519.9428 995.4399 C 519.9000 994.7828 519.3713 994.0257 518.7572 993.7685 L 516.5285 992.8399 C 515.9142 992.5828 515.2428 991.8543 515.0428 991.2257 L 514.4857 989.5113 C 514.3571 989.1114 514.2285 988.5256 514.1713 987.9971 C 514.1142 987.6972 514.0856 987.3970 514.0856 987.1685 L 514.0856 987.1115 C 514.0714 986.4543 514.4285 985.4971 514.8713 985.0114 L 515.1571 984.6971 C 515.3428 984.4829 515.5571 984.3829 515.7427 984.3686 C 516.0000 984.3542 516.2285 984.5257 516.3571 984.8542 C 516.5856 985.4256 516.9856 985.7971 517.2570 985.6685 C 517.5427 985.5400 517.8999 984.9257 518.0571 984.3256 C 518.2142 983.7114 518.8142 982.9400 519.3856 982.6114 L 519.5428 982.5257 C 520.1142 982.1971 520.7142 981.3970 520.8858 980.7542 L 521.8999 976.9971 C 522.0714 976.3543 521.7999 975.4686 521.2999 975.0400 L 520.6572 974.4971 C 520.1572 974.0686 519.3713 973.3258 518.9000 972.8543 L 518.7286 972.6829 C 518.7000 972.6542 518.6715 972.6257 518.6286 972.5971 C 518.1428 972.1685 517.2857 971.8256 516.6714 971.8256 L 513.0427 971.8256 C 512.7570 971.8256 512.3286 971.8115 511.8857 971.8256 C 513.2714 970.6544 514.7999 969.6687 516.4428 968.8828 C 516.4571 968.8686 516.4714 968.8686 516.4857 968.8686 C 519.2285 967.5686 522.2856 966.8400 525.5 966.8400 C 532.5572 966.8400 538.8143 970.3256 542.6286 975.6542 L 538.0429 975.0400 C 537.6571 974.9829 537.1856 975.0828 536.7714 975.2829 C 536.4856 975.4114 536.2428 975.5828 536.0714 975.7971 L 534.1000 978.1828 L 531.9714 980.7542 L 531.9000 980.8258 C 531.4858 981.3399 531.1000 982.2971 531.0571 982.9543 L 530.9429 984.6400 C 530.9000 985.2971 531.2572 985.4686 531.7428 985.0257 L 532.4286 984.3829 C 532.9143 983.9400 533.8572 983.5686 534.5143 983.5686 L 535 983.5686 C 535.6713 983.5686 536.3429 984.0971 536.5001 984.7401 L 536.6428 985.2971 C 536.7999 985.9400 536.7428 986.8256 536.5285 987.2828 C 536.2999 987.7255 535.5857 988.0544 534.9143 987.9827 L 533.1572 987.8258 C 532.5000 987.7542 531.5999 988.0972 531.1429 988.5971 L 530.5571 989.2399 C 530.4570 989.3543 530.3571 989.4971 530.2714 989.6542 C 529.9857 990.1542 529.8286 990.8258 529.9000 991.3258 L 530.1428 992.9829 C 530.1572 993.1400 530.2142 993.3114 530.2857 993.4829 C 530.4856 994.0257 530.8714 994.5971 531.2713 994.8970 L 532.0999 995.4970 C 532.6285 995.8972 533.0571 996.7542 533.0571 997.4257 L 533.0 1001.297 C 532.9856 1001.868 533.3142 1002.525 533.7428 1002.854 C 533.8143 1002.911 533.8857 1002.954 533.9570 1002.997 C 534.5 1003.268 535.3000 1003.082 535.7429 1002.582 L 536.5428 1001.697 C 536.9856 1001.197 537.5429 1000.282 537.7856 999.6685 C 537.7856 999.6685 538.3001 998.3258 538.3001 998.0543 C 538.3001 997.7971 538.7429 997.5827 538.7429 997.5827 C 539.3429 997.3114 540.0285 996.7114 540.2571 996.2543 C 540.4285 995.8972 540.6714 995.3828 540.8427 994.9543 C 540.9 994.8399 540.9428 994.7258 540.9713 994.6256 C 541.1285 994.1971 541.6857 993.4971 542.2142 993.0970 L 542.2999 993.0258 C 542.8285 992.6114 543.5285 991.8115 543.8856 991.2399 L 544.3571 990.4542 C 544.4571 990.2972 544.4999 990.1398 544.5142 990.0258 C 544.5142 989.9685 544.4999 989.9113 544.4856 989.84 C 544.4 989.6542 544.1714 989.5828 543.8 989.6542 L 543.7142 989.6828 C 543.0714 989.8114 542.0856 989.6114 541.5427 989.2257 L 541.0285 988.8686 C 540.4857 988.4971 540.1284 987.9686 540.2286 987.7114 C 540.3428 987.4542 540.9142 987.5114 541.4857 987.8399 L 541.9142 988.0827 C 542.4857 988.4116 543.4999 988.64 544.1571 988.5971 L 544.2570 988.5828 L 544.6999 988.5543 C 545.3571 988.4971 546.0571 988.1684 546.2428 987.8114 C 546.3857 987.5399 546.5 987.1544 546.5571 986.8542 C 546.5856 987.2114 546.6 987.5686 546.6 987.9399 C 546.6 988.1971 546.6 988.4543 546.5856 988.7258 Z">
			</path>
		</svg>
		<div id="subIconPBox">
			<div id="subIconPBox1">
				<svg class="subIconBox" viewBox="0 0 342 79">
					<path id="subIconBox" d="M 20 0 L 322 0 C 333.045684 0 342 8.9543047 342 20 L 342 59 C 342 70.0456924 333.045684 79 322 79 L 20 79 C 8.95430469 79 0 70.0456924 0 59 L 0 20 C 0 8.9543047 8.9543047 0 20 0 Z">
					</path>
				</svg>
				<svg class="writeIcon" viewBox="3 2.997 34 34">
					<path id="writeIcon" d="M 3 29.9151535 L 3 36.9975013 L 10.0823497 36.9975013 L 30.97056 16.109291 L 23.8882102 9.02693939 L 3 29.9151535 Z M 36.4475784 10.6322727 C 37.184143 9.89570903 37.184143 8.70587348 36.4475784 7.9693098 L 32.0281906 3.54992318 C 31.2916278 2.81335854 30.1017894 2.81335854 29.3652286 3.54992318 L 25.9090404 7.00611019 L 32.9913864 14.0884618 L 36.4475784 10.6322746 Z">
					</path>
				</svg>
				<svg class="sendMessageIcon" viewBox="0 2.666 34 28">
					<path id="sendMessageIcon" d="M 15.2734375 19.8500843 L 14.1673746 30.666 L 20.9248752 22.4162521 L 27.3901863 25.3005657 L 34 2.66704964 L 15.2734375 19.8500843 Z M 34 2.66704988 L 0 16.4775276 L 8.02718734 18.0661582 L 14.1673746 30.6660003 L 9.73993682 18.0661582 L 34 2.66600036 Z">
					</path>
				</svg>
				<svg class="messageBoxIcon" viewBox="0 0 34 32">
					<path id="messageBoxIcon" d="M 14.1666667 4 C 12.6716108 4 11.2275552 4.2487 9.87605476 4.738 C 8.60955524 5.1977 7.48188877 5.84499979 6.52611064 6.6648 C 4.754333 8.182 3.77777743 10.1269998 3.77777743 12.138 C 3.77777743 13.263 4.07527732 14.355 4.66083335 15.385 C 5.27094411 16.458 6.19272232 17.441 7.32511091 18.2270011 C 8.22327709 18.851 8.82866573 19.85 8.98827743 20.975 C 9.01472187 21.162 9.03644371 21.35 9.05249977 21.539 C 9.13277721 21.46 9.21211051 21.379 9.29238796 21.295 C 10.0044994 20.544 10.965 20.129 11.9585552 20.129 C 12.1162767 20.129 12.2749443 20.14 12.4336109 20.161 C 13.005 20.237999 13.588667 20.2769985 14.1676101 20.2769985 C 15.6626663 20.2769985 17.1067199 20.0289993 18.4582214 19.5389976 C 19.72472 19.079998 20.8523864 18.4319972 21.8081665 17.612997 C 23.5799427 16.0949974 24.5564994 14.1499967 24.5564994 12.138997 C 24.5564994 10.1279973 23.5808868 8.18299674 21.8081665 6.6649971 C 20.8523883 5.84599685 19.7247219 5.19799709 18.4582214 4.73899698 C 17.1067199 4.24899673 15.6626663 4.00099706 14.1676092 4.00099706 Z M 14.166666 0 L 14.166666 0 C 21.9904441 0 28.333332 5.43499994 28.333332 12.139 C 28.333332 18.843 21.9904441 24.2779998 14.166666 24.2779998 C 13.4148893 24.278 12.6782217 24.2269992 11.957611 24.131 C 8.91461086 27.34 5.4003334 27.916 1.88888883 28 L 1.88888883 27.215 C 3.78533315 26.235 5.3125 24.45 5.3125 22.411 C 5.3125 22.126 5.29172229 21.847 5.25299978 21.574 C 2.04944419 19.349 0 15.9489994 0 12.14 C 0 5.43599939 6.34288883 0.00099945 14.166666 0.00099945 Z M 29.395832 27.209 C 29.3958320 28.9569988 30.4677753 30.487 32.1111106 31.327 L 32.1111106 32 C 29.0671653 31.9279994 26.2735 31.434 23.63661 28.684 C 23.0123329 28.767 22.3738880 28.81 21.7222213 28.8099994 C 18.9049434 28.81 16.3086662 28.0049991 14.2374992 26.6529998 C 18.5073337 26.637 22.5382194 25.189 25.5953884 22.569 C 27.1357765 21.249 28.3522224 19.6990013 29.20789 17.964 C 30.1154994 16.124 30.5763874 14.165 30.5763874 12.139 C 30.5763874 11.813 30.5631656 11.488 30.5395526 11.165 C 32.6815528 13.038001 34 15.5910015 34 18.4050006 C 34 21.6700000 32.2244415 24.5839996 29.4477767 26.4910011 C 29.4137783 26.7250003 29.395832 26.965002 29.395832 27.2090015 Z">
					</path>
				</svg>

				<svg class="bookmark" viewBox="6 0 20 32">
					<path id="bookmark" d="M 24 32 L 16 21 L 7.99999952 32 C 6.89599895 32 5.99999952 31.104 5.99999952 30 L 5.99999952 2 C 5.99999952 0.896 6.89599895 0 7.99999952 0 L 24 0 C 25.1040019 0 26 0.896 26 2 L 26 30 C 26 31.104 25.1040019 32 24 32 Z M 23.5 2 L 8.49999904 2 C 8.22399997 2 7.99999952 2.224 7.99999952 2.50000023 C 7.99999952 2.776 8.22399997 3 8.49999904 3 L 23.5 3 C 23.775999 3 24 2.77600002 24 2.50000023 C 24 2.22399997 23.7759990 2 23.5 2 Z">
					</path>
				</svg>
				<div id="optionIconPBox">
					<svg class="optionIconBox1" viewBox="80.5 1122.939 34 34.001">
						<path id="optionIconBox1" d="M 114.285308 1137.36096 C 114.204689 1136.82946 113.838462 1136.38659 113.333312 1136.2069 L 110.65509 1135.25488 C 110.495773 1134.80603 110.316062 1134.36999 110.116905 1133.94738 L 111.336051 1131.38171 C 111.566284 1130.89794 111.511894 1130.32678 111.194236 1129.89355 C 110.16645 1128.4967 108.938568 1127.26867 107.545547 1126.24584 C 107.112289 1125.92810 106.542060 1125.87487 106.057312 1126.10485 L 103.493721 1127.32324 C 103.071151 1127.12402 102.634979 1126.94433 102.185203 1126.78601 L 101.232231 1124.10681 C 101.053489 1123.60253 100.611488 1123.23730 100.081085 1123.15563 C 98.1984634 1122.86621 96.8044586 1122.86621 94.9189224 1123.15563 C 94.3894882 1123.2373 93.9465255 1123.60253 93.7677688 1124.10681 L 92.8148117 1126.78601 C 92.3650283 1126.94433 91.9288635 1127.12402 91.5072631 1127.32324 L 88.9417266 1126.10485 C 88.4579467 1125.87487 87.8867492 1125.9281 87.4544601 1126.24584 C 86.0614395 1127.26867 84.8335418 1128.4967 83.8057708 1129.89355 C 83.4881134 1130.32678 83.4337234 1130.89794 83.6639556 1131.38171 L 84.8830871 1133.94738 C 84.6839447 1134.36889 84.5042266 1134.80603 84.3449172 1135.25488 L 81.6666946 1136.20788 C 81.1615524 1136.38745 80.7953186 1136.83056 80.7146987 1137.36096 C 80.5680084 1138.32067 80.5 1139.13964 80.5 1139.93994 C 80.5 1140.73950 80.5680084 1141.55944 80.7146987 1142.51916 C 80.7953186 1143.05053 81.1615524 1143.49353 81.6666946 1143.67321 L 84.3449172 1144.62524 C 84.5042266 1145.07495 84.6839447 1145.51135 84.8830871 1145.93383 L 83.6639556 1148.49829 C 83.4337234 1148.98217 83.4881134 1149.55346 83.8057708 1149.98559 C 84.8315963 1151.38171 86.059494 1152.60949 87.4544601 1153.63427 C 87.8867492 1153.95190 88.4579467 1154.00634 88.9426956 1153.77514 L 91.5062942 1152.55700 C 91.9288635 1152.75622 92.3650283 1152.93579 92.8148117 1153.09411 L 93.7677688 1155.77343 C 93.9465255 1156.27758 94.3885116 1156.64282 94.9189224 1156.72436 C 95.8612060 1156.87011 96.7053756 1156.93994 97.5 1156.93994 C 98.2946319 1156.93994 99.1388015 1156.87011 100.081085 1156.72436 C 100.611488 1156.64282 101.053489 1156.27758 101.232231 1155.77343 L 102.185203 1153.09411 C 102.634979 1152.93579 103.071151 1152.75622 103.493721 1152.55700 L 106.057312 1153.77514 C 106.542060 1154.00634 107.113265 1153.9519 107.545547 1153.63427 C 108.942451 1152.60754 110.170341 1151.37963 111.194236 1149.98559 C 111.511894 1149.55346 111.566284 1148.98217 111.336051 1148.49829 L 110.116905 1145.93383 C 110.316062 1145.51135 110.495773 1145.07397 110.655090 1144.62524 L 113.333312 1143.67321 C 113.838462 1143.49353 114.204689 1143.05053 114.285308 1142.51916 C 114.431999 1141.55944 114.500007 1140.73950 114.500007 1139.93994 C 114.500007 1139.1405 114.431999 1138.32067 114.285308 1137.36096 Z M 111.515777 1141.22631 L 109.002693 1142.11987 C 108.563598 1142.27539 108.225547 1142.63195 108.093429 1143.07971 C 107.869033 1143.83935 107.573715 1144.55725 107.214286 1145.21582 C 106.991836 1145.62585 106.977249 1146.11645 107.177368 1146.53820 L 108.317825 1148.93542 C 107.767028 1149.59606 107.157943 1150.20617 106.495437 1150.75683 L 104.098915 1149.61840 C 103.677322 1149.41625 103.186744 1149.43188 102.776802 1149.65417 C 102.117202 1150.01281 101.399322 1150.30822 100.639663 1150.53247 C 100.192810 1150.66455 99.8362960 1151.00268 99.6798934 1151.44189 L 98.7861785 1153.95581 C 97.8730392 1154.04809 97.1269683 1154.04809 96.2138366 1153.95581 L 95.3201141 1151.44189 C 95.1637191 1151.00366 94.8072052 1150.66455 94.3603439 1150.53247 C 93.6006927 1150.30822 92.8818435 1150.01281 92.2232055 1149.65417 C 91.8132705 1149.43103 91.3217163 1149.41625 90.9010925 1149.61840 L 88.5045776 1150.75793 C 87.8430328 1150.20617 87.2339477 1149.59704 86.6821823 1148.93542 L 87.8226394 1146.5382 C 88.0227584 1146.11645 88.008171 1145.62585 87.7857208 1145.21582 C 87.4272537 1144.55920 87.1319427 1143.84045 86.9065856 1143.07885 C 86.7744598 1142.63195 86.4364089 1142.27539 85.9973144 1142.11987 L 83.4842300 1141.22631 C 83.4366378 1140.76965 83.4142913 1140.34814 83.4142913 1139.93994 C 83.4142913 1139.5321 83.4366378 1139.11145 83.48423 1138.65490 L 85.9982986 1137.76025 C 86.4364089 1137.60485 86.7744598 1137.24816 86.9065856 1136.80139 C 87.1319427 1136.04187 87.4272537 1135.32287 87.7857208 1134.66333 C 88.0081710 1134.25439 88.0227584 1133.76281 87.8226394 1133.34216 L 86.6821823 1130.94470 C 87.2339477 1130.28320 87.8430328 1129.67309 88.5045776 1129.12219 L 90.9020538 1130.26184 C 91.3217163 1130.46386 91.8142318 1130.44812 92.2241744 1130.22570 C 92.8818435 1129.86743 93.6006927 1129.57202 94.3603439 1129.34765 C 94.8072052 1129.21545 95.1637191 1128.87658 95.3201141 1128.43835 L 96.2138366 1125.92419 C 97.1182403 1125.83093 97.8662338 1125.83093 98.7861785 1125.92419 L 99.6798934 1128.43835 C 99.8362960 1128.87658 100.192810 1129.21545 100.639663 1129.34765 C 101.399322 1129.57202 102.118179 1129.86743 102.776802 1130.22570 C 103.186744 1130.44934 103.677322 1130.46386 104.098915 1130.26184 L 106.495437 1129.12219 C 107.156974 1129.67309 107.766059 1130.28320 108.317825 1130.94470 L 107.177368 1133.34216 C 106.977249 1133.76281 106.991836 1134.25439 107.214286 1134.66333 C 107.573715 1135.32470 107.869033 1136.04260 108.093429 1136.80041 C 108.225547 1137.24816 108.563598 1137.60485 109.002693 1137.76025 L 111.515777 1138.65393 C 111.563377 1139.11059 111.585716 1139.53210 111.585716 1139.93994 C 111.585716 1140.34814 111.563377 1140.76965 111.515777 1141.22631 Z">
						</path>
					</svg>
					<svg class="optionIconBox2" viewBox="91.056 1133.143 14 14">
						<path id="optionIconBox2" d="M 98.0559997 1133.14294 C 94.1961288 1133.14294 91.0559997 1136.28295 91.0559997 1140.14257 C 91.0559997 1144.00305 94.1961288 1147.14294 98.0559997 1147.14294 C 101.915893 1147.14294 105.055999 1144.00305 105.055999 1140.14257 C 105.055999 1136.28295 101.915893 1133.14294 98.0559997 1133.14294 Z">
						</path>
					</svg>
				</div>
			</div>
			<svg class="boxVertex" viewBox="0 -8 16 16.809">
				<path id="boxVertex" d="M 8 -8 C 8 -8 8.17773437 -3.2769775 11 0.5 C 13.8222656 4.27697753 16 4 16 4 L 16 8.80944824 L 0 8.31127929 L 0 4 C 0 4 2 4 5 0.5 C 8 -3 8 -8 8 -8 Z">
				</path>
			</svg>
		</div>
	</div>
	</div>
	    <li class="chat-item" data-id="{{id}}">
	      <div class="bubble">
	           	<div class=hashId>
<!-- 
아이디 표시 위치
<span>id</span>
 -->		</div>
	        <div class =plusBox>
	        		<svg class="plusBoxIcon" viewBox="10 4 8 32">
						<path id="plusBoxIcon" d="M 13.99999904632568 12.00000095367432 C 16.19999885559082 12.00000095367432 17.99999809265137 10.20000171661377 17.99999809265137 8.000000953674316 C 17.99999809265137 5.799999713897705 16.19999885559082 4 13.99999904632568 4 C 11.79999923706055 4 9.999999046325684 5.799999713897705 9.999999046325684 8.000000953674316 C 9.999999046325684 10.20000171661377 11.79999923706055 12.00000095367432 13.99999904632568 12.00000095367432 Z M 13.99999904632568 16.00000190734863 C 11.79999923706055 16.00000190734863 9.999999046325684 17.80000114440918 9.999999046325684 20.00000381469727 C 9.999999046325684 22.20000267028809 11.79999923706055 24.00000381469727 13.99999904632568 24.00000381469727 C 16.19999885559082 24.00000381469727 17.99999809265137 22.20000267028809 17.99999809265137 20.00000381469727 C 17.99999809265137 17.80000114440918 16.19999885559082 16.00000190734863 13.99999904632568 16.00000190734863 Z M 13.99999904632568 28.00000381469727 C 11.79999923706055 28.00000381469727 9.999999046325684 29.80000495910645 9.999999046325684 32.00000381469727 C 9.999999046325684 34.20000076293945 11.79999923706055 36 13.99999904632568 36 C 16.19999885559082 36 17.99999809265137 34.20000076293945 17.99999809265137 32.00000381469727 C 17.99999809265137 29.80000495910645 16.19999885559082 28.00000381469727 13.99999904632568 28.00000381469727 Z">
						</path>
					</svg>
					<svg class="favoriteIcon1" viewBox="2 3 30 27">
						<path id="favoriteIcon1" d="M 17 30 L 14.824997 28.057767 C 7.0999984 21.186378 2 16.654495 2 11.092643 C 2 6.5607643 5.6299982 2.9999997 10.249997 2.9999997 C 12.859997 2.9999997 15.364994 4.1918258 16.999996 6.0752062 C 18.634998 4.1918258 21.139997 2.9999997 23.749998 2.9999997 C 28.369993 2.9999997 31.999998 6.5607643 31.999998 11.092643 C 31.999998 16.654495 26.89999 21.18638 19.174995 28.072484 L 16.999996 30.000001 Z">
						</path>
					</svg>
					<svg class="favoriteIcon2" viewBox="2 3 30 27">
						<path id="favoriteIcon2" d="M 17 30 L 14.824997 28.057767 C 7.0999984 21.186378 2 16.654495 2 11.092643 C 2 6.5607643 5.6299982 2.9999997 10.249997 2.9999997 C 12.859997 2.9999997 15.364994 4.1918258 16.999996 6.0752062 C 18.634998 4.1918258 21.139997 2.9999997 23.749998 2.9999997 C 28.369993 2.9999997 31.999998 6.5607643 31.999998 11.092643 C 31.999998 16.654495 26.89999 21.18638 19.174995 28.072484 L 16.999996 30.000001 Z">
						</path>
					</svg>
					<svg class="favoriteIcon3" viewBox="2 3 30 27">
						<path id="favoriteIcon3" d="M 17 30 L 14.824997 28.057767 C 7.0999984 21.186378 2 16.654495 2 11.092643 C 2 6.5607643 5.6299982 2.9999997 10.249997 2.9999997 C 12.859997 2.9999997 15.364994 4.1918258 16.999996 6.0752062 C 18.634998 4.1918258 21.139997 2.9999997 23.749998 2.9999997 C 28.369993 2.9999997 31.999998 6.5607643 31.999998 11.092643 C 31.999998 16.654495 26.89999 21.18638 19.174995 28.072484 L 16.999996 30.000001 Z">
						</path>
					</svg>
				<svg class="invisibleIcon" viewBox="1 3 40 30">
					<path id="invisibleIcon" d="M 21.009094 9.3157882 C 26.02956 9.3157882 30.104137 12.852629 30.104137 17.210527 C 30.104137 18.236843 29.867666 19.200000 29.449291 20.100000 L 34.760799 24.710527 C 37.507503 22.721052 39.672122 20.147369 41.000003 17.210527 C 37.853118 10.278946 30.085947 5.3684215 20.990903 5.3684215 C 18.444292 5.3684215 16.00682 5.7631578 13.751249 6.4736838 L 17.680309 9.8842096 C 18.717144 9.5210514 19.82674 9.3157882 21.009094 9.3157882 Z M 2.8190088 5.0052638 L 6.9663476 8.6052627 L 7.8030924 9.3315782 C 4.7835378 11.36842 2.4188265 14.08421 1 17.210527 C 4.1468849 24.142105 11.914052 29.052631 21.009094 29.052631 C 23.828557 29.052631 26.52069 28.578948 28.976354 27.726316 L 29.740337 28.389472 L 35.07003 33 L 37.380176 30.994735 L 5.1291499 3 L 2.8190088 5.0052638 Z M 12.878126 13.736841 L 15.697589 16.184213 C 15.606637 16.51579 15.552068 16.863159 15.552068 17.210527 C 15.552068 19.831579 17.98954 21.947368 21.009094 21.947368 C 21.409276 21.947368 21.809457 21.900001 22.191448 21.821052 L 25.010913 24.268419 C 23.792177 24.789472 22.446109 25.105264 21.009094 25.105264 C 15.988630 25.105264 11.914052 21.568422 11.914052 17.210527 C 11.914052 15.963158 12.277852 14.794735 12.878125 13.736841 Z M 20.718051 12.505263 L 26.447931 17.478948 L 26.48431 17.226318 C 26.48431 14.605262 24.046838 12.489472 21.027284 12.489472 L 20.718051 12.505263 Z">
					</path>
				</svg>
				<svg class="shareIcon" viewBox="665.063 -170.939 27 30">
					<path id="shareIcon" d="M 687.5629882 -149.733871 C 686.4226684 -149.733871 685.4030151 -149.282058 684.6227416 -148.574523 L 673.9279785 -154.823928 C 674.0026855 -155.170913 674.0629882 -155.516998 674.0629882 -155.878448 C 674.0629882 -156.239883 674.0026855 -156.585968 673.9279785 -156.932968 L 684.5030517 -163.122726 C 685.3129272 -162.369110 686.3776245 -161.902847 687.5629882 -161.902847 C 690.0532836 -161.902847 692.0629882 -163.920608 692.0629882 -166.420913 C 692.0629882 -168.920318 690.0532836 -170.93898 687.5629882 -170.93898 C 685.0726928 -170.93898 683.0629272 -168.920318 683.0629272 -166.420913 C 683.0629272 -166.059478 683.1232910 -165.712478 683.1979980 -165.366409 L 672.6229858 -159.176635 C 671.8129882 -159.929351 670.7482910 -160.396530 669.5629882 -160.396530 C 667.0727539 -160.396530 665.0629882 -158.378753 665.0629882 -155.878448 C 665.0629882 -153.378143 667.0727539 -151.360382 669.5629882 -151.360382 C 670.7482910 -151.360382 671.8129882 -151.827545 672.6229858 -152.580245 L 683.3032836 -146.31549 C 683.2276 -145.999237 683.1826171 -145.667602 683.1826171 -145.335968 C 683.1826171 -142.911575 685.1482543 -140.938995 687.5629882 -140.938995 C 689.9776611 -140.938995 691.9432983 -142.911575 691.9432983 -145.335968 C 691.9432983 -147.761276 689.9776611 -149.733871 687.5629882 -149.733871 Z">
					</path>
				</svg>
				<div id="reportPBoxIcon">
					<svg class="reportIcon1" viewBox="12 -0.21 28 18">
						<path id="reportIcon1" d="M 22.3199997 -0.21 L 29.6800003 -0.21 C 32.1432991 0.250935703 34.01918792 1.337349176 35.88377761 3.379324436 C 38.56800842 6.245957374 39.5890007 11.782692 40 17.79000282 L 12 17.79000282 C 12.54000091 8.866735458 15.8244629 0.936089396 22.3199997 -0.21 Z">
						</path>
					</svg>
					<svg class="reportIcon2">
						<rect id="reportIcon2" rx="0" ry="0" x="0" y="0" width="40" height="6">
						</rect>
					</svg>
					<svg class="reportIcon3">
						<ellipse id="reportIcon3" rx="3" ry="3" cx="3" cy="3">
						</ellipse>
					</svg>
					<svg class="reportIcon4" viewBox="0 0 12 1">
						<path id="reportIcon4" d="M 0 0 L 12 0">
						</path>
					</svg>
			</div>
			<div id="invisibleFont">
				<span>INVISIBLE</span>
			</div>
			<div id="notinterestedFont">
				<span>not interested</span>
			</div>
			<div id="shareFont">
				<span>SHARE</span>
			</div>
			<div id="reportFont">
				<span>REPORT</span>
			</div>
		</div>
	        <div class="meta">
		   <div class="timePost">
<!--           
시간 표시 위치
<time class="posted-date"></time>
-->		  
		   </div>
	        </div>
<!--
이미지 위치
<img>
-->
	 	       <div id="contentsssssss">
			     <div id="contentsButtonPBox">
					<div id="contentsUpButtonPBox">
						<svg class="contentsUpButtonBright" viewBox="4 4 110 110">
							<path id="contentsUpButtonBright" d="M 8 0 L 46 0 C 50.4182777 0 54 3.58172178 54 8 L 54 46 C 54 50.4182777 50.4182777 54 46 54 L 8 54 C 3.58172178 54 0 50.4182777 0 46 L 0 8 C 0 3.58172178 3.58172178 0 8 0 Z">
							</path>
						</svg>
						<svg class="contentsUpButtonShadow">
							<rect id="contentsUpButtonShadow" rx="8" ry="8" x="0" y="0" width="54" height="54">
							</rect>
						</svg>
						<svg class="contentsUpButtonBox">
							<rect id="contentsUpButtonBox" rx="8" ry="8" x="0" y="0" width="54" height="54">
							</rect>
						</svg>
						<svg class="contentsUpButton" viewBox="2.239 9.452 28 14">
							<path id="contentsUpButton" d="M 28.3153247 23.1462574 C 28.7579002 23.5542335 29.4690742 23.5542335 29.908596 23.1462574 C 30.3481197 22.7382831 30.3501548 22.0792465 29.908596 21.6722221 L 17.0352535 9.75822067 C 16.5957336 9.35024642 15.8845596 9.35024642 15.4419851 9.75822067 L 2.56864213 21.6722221 C 2.12911915 22.0801963 2.12911915 22.739233 2.56864213 23.1462574 C 3.01019978 23.5542316 3.72238969 23.5542316 4.16191244 23.1462574 L 16.2386207 12.2802467 L 28.3143081 23.1462574 Z">
							</path>
						</svg>
					</div>
						<div id="contentsDownButtonPBox">
							<svg class="contentsDownButtonBright" viewBox="4 4 110 110">
							<path id="contentsDownButtonBright" d="M 8 0 L 46 0 C 50.4182777 0 54 3.58172178 54 8 L 54 46 C 54 50.4182777 50.4182777 54 46 54 L 8 54 C 3.58172178 54 0 50.4182777 0 46 L 0 8 C 0 3.58172178 3.58172178 0 8 0 Z">
							</path>
						</svg>
						<svg class="contentsDownButtonShadow">
							<rect id="contentsDownButtonShadow" rx="8" ry="8" x="0" y="0" width="54" height="54">
							</rect>
						</svg>
						<svg class="contentsDownButtonBox">
							<rect id="contentsDownButtonBox" rx="8" ry="8" x="0" y="0" width="54" height="54">
							</rect>
						</svg>
						<svg class="contentsDownButton" viewBox="2.239 9.452 28 14">
							<path id="contentsDownButton" d="M 28.3153247 9.75822067 C 28.7579002 9.35024642 29.4690742 9.35024642 29.908596 9.75822067 C 30.3481197 10.1661958 30.3501548 10.8252315 29.908596 11.2322559 L 17.0352535 23.1462593 C 16.5957336 23.5542335 15.8845596 23.5542335 15.4419851 23.1462593 L 2.56864213 11.2322568 C 2.12911915 10.8242826 2.12911915 10.165246 2.56864213 9.75822257 C 3.01019978 9.35024738 3.72238969 9.35024738 4.16191244 9.75822257 L 16.2386207 20.6242332 L 28.3143081 9.75822257 Z">
							</path>
						</svg>
					</div>
				</div>
	     		   <p class="hashtag">
<!-- 
해시태그 위치 
#HASHTAG/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</p>
-->
				        <div class="contentsss">
<!--
게시물 내용 위치
<p>
</p>
-->
				        </div>
				     </div>
	        <div class="meta">
			<!-- 여긴 x <time class="posted-date"></time> -->
	        </div>
	      </div>
	    </li>
</div>
	    <li class="chat-item tombstone" data-id="{{id}}">
	      <div class="bubble" id="beforeBubble">
	      	<div class =plusBox></div>
	        <p></p>
	        <p></p>
	        <p></p>
	      </div>
	    </li>
  </div>
  <ul id="chat-timeline">
  
  </ul>
  <script src="es6-promise.js"></script>
  <script src="stats.min.js"></script>
  <script src="scripts/infinite-scroll.js"></script>
  <script src="scripts/messages.js"></script>
  <script>
var INIT_TIME = new Date().getTime();

/**
 * Constructs a random item with a given id.
 * @param {number} id An identifier for the item.
 * @return {Object} A randomly generated item.
 */
function getItem(id) {
  function pickRandom(a) {
      return a[Math.floor(Math.random() * a.length)];
  }

  return new Promise(function(resolve) {
    var item = {
      id: id,
/*       avatar: Math.floor(Math.random()*NUM_AVATARS), */
      self: Math.random() < 0.1,
      image: Math.random() < 1.0 / 20 ? Math.floor(Math.random()*NUM_IMAGES) : '',
      time: new Date(Math.floor(INIT_TIME + id*20*1000 + Math.random()*20*1000)),
      message: pickRandom(MESSAGES)
    }
    if(item.image === '') {
      resolve(item);
    }
    var image = new Image();
    image.src = 'images/image' + item.image + '.jpg';
    image.addEventListener('load', function() {
      item.image = image;
      resolve(item);
    });
    image.addEventListener('error', function() {
      item.image = '';
      resolve(item);
    });
  });
}

function ContentSource() {
  // Collect template nodes to be cloned when needed.
  this.tombstone_ = document.querySelector("#templates > .chat-item.tombstone");
  this.messageTemplate_ = document.querySelector("#templates >#mainBarBox > .chat-item:not(.tombstone)");
  this.nextItem_ = 0;
}

ContentSource.prototype = {
  fetch: function(count) {
    // Fetch at least 30 or count more objects for display.
    count = Math.max(30, count);
    return new Promise(function(resolve, reject) {
      // Assume 50 ms per item.
      setTimeout(function() {
        var items = [];
        for (var i = 0; i < Math.abs(count); i++) {
          items[i] = getItem(this.nextItem_++);
        }
        resolve(Promise.all(items));
      }.bind(this), 1000 /* Simulated 1 second round trip time */ );
    }.bind(this));
  },

  createTombstone: function() {
    return this.tombstone_.cloneNode(true);
  },

  render: function(item, div) {
    // TODO: Different style?
    div = div || this.messageTemplate_.cloneNode(true);
    div.dataset.id = item.id;
/*     div.querySelector('.avatar').src = 'images/avatar' + item.avatar + '.png'; */
/* div.querySelector('.bubble p.hashtag').textContent = item.message; */
	div.querySelector('.contentsss p').textContent = item.message;
    div.querySelector('.bubble .posted-date').textContent = item.time.toString();

    var img = div.querySelector('.bubble img');
    if(item.image !== '') {
      img.classList.remove('invisible');
      img.src = item.image.src;
      img.width = item.image.width;
      img.height = item.image.height;
    } else {
      img.src = '';
      img.classList.add('invisible');
    }

    if(item.self) {
      div.classList.add('from-me');
    } else {
      div.classList.remove('from-me');
    }
    return div;
  },

};

function numDomNodes(node) {
  if(!node.children || node.children.length == 0)
    return 0;
  var childrenCount = Array.from(node.children).map(numDomNodes);
  return node.children.length + childrenCount.reduce(function(p, c){ return p + c; }, 0);
}

document.addEventListener('DOMContentLoaded', function() {
  window.scroller =
    new InfiniteScroller(
      document.querySelector('#chat-timeline'),
      new ContentSource()
    );

/*   var stats = new Stats();
  var domPanel = new Stats.Panel('DOM Nodes', '#0ff', '#002');
  stats.addPanel(domPanel);
  stats.showPanel(3);
  document.body.appendChild(stats.dom);
  var TIMEOUT = 100;
  setTimeout(function timeoutFunc() {
    // Only update DOM node graph when we have time to spare to call
    // numDomNodes(), which is a fairly expensive function.
    requestIdleCallback(function() {
      domPanel.update(numDomNodes(document.body), 1500);
      setTimeout(timeoutFunc, TIMEOUT);
    });
  }, TIMEOUT);
 */

});
</script>
</body>
</html>
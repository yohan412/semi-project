<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th, td{
		display: block;
	}
	td input[type="text"], input[type="password"] {
    	width: 350px; height: 30px;
    	font-size: 0.8rem;
    	border: 1px solid #d1d1d1;
	}
	th {
    	margin: 10px 0 8px;
   		font-size: 1.0rem;
   		font-weight: 400;
    	text-align: left;
	}
	
	#zipcode,#id,#username{
		width : 260px;
	}
	#id_chk,#zip_chk,#join{
	 	width : 80px;
	 	height : 30px;
		background-color:rgb(75, 161, 231);
		border: 1px solid gray;
		border-radius: 5px;
		cursor:pointer;
	}
	#reset{
		cursor:pointer;
	}
	#birth{
		size : 180px;
	}
	
	input[type=checkbox]{
		margin-left: 10px;
	}

	input[type="checkbox"] {
	  	width: 18px; 
  		height: 18px; 
	}
	
</style>

</head>
<body>
	<div style="text-align: center; margin-top: 30px;">
		<a href="#"><img src="./img/tmp_image.png" width="200px" height="60px" alt="내주변 헬스장"></a>
	</div>
	<br><br>
	<hr>
	<div id="wrap" align="center">
		<form action="" method="post">
			<table align="center" method="post" cellpadding="3">
				<tr>
					<th>I D</th>
					<td width="100%">
						<input type="text" id="id" placeholder="아이디를 입력하세요" required="required" autofocus>&nbsp;&nbsp;
						<input type="button" id="id_chk" value="중복 확인" onclick="">
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<input type="password" id="pw" size="20" placeholder="비밀번호를 입력하세요" required><br><br>
						<input type="password" id="pw" size="20" placeholder="비밀번호 재확인" required>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<input type="text" id="username" size="20" placeholder="이름을 입력하세요" required>&nbsp;&nbsp;
						<select id="gender" style="width:80px;height:30px;">
							<option value="men">남자</option>
							<option value="women">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><input type="text" id="nickname" size="10" placeholder="닉네임을 입력하세요(선택)"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" id="email" size="30" placeholder="이메일을 입력하세요" required></td>
				</tr>
				<tr>
				
				<div id="birth">
					<th>Year / Month / Day</th>
					<td>
						<input type="text" id="birth_yy" placeholder="년(4자)" maxlength="4" style="width:80px;height:30px;">
						
						&nbsp;&nbsp;&nbsp;
						<select id="birth_mm" style="width:80px;height:30px;">
                            <option value="0" selected> 월 </option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
						&nbsp;&nbsp;&nbsp;
						<select id="birth_dd" style="width:80px;height:30px;">
							<option value="0" selected> 일 </option>
							<option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                            <option value="13" >13</option>
                            <option value="14" >14</option>
                            <option value="15" >15</option>
                            <option value="16" >16</option>
                            <option value="17" >17</option>
                            <option value="18" >18</option>
                            <option value="19" >19</option>
                            <option value="20" >20</option>
                            <option value="21" >21</option>
                            <option value="22" >22</option>
                            <option value="23" >23</option>
                            <option value="24" >24</option>
                            <option value="25" >25</option>
                            <option value="26" >26</option>
                            <option value="27" >27</option>
                            <option value="28" >28</option>
                            <option value="29" >29</option>
                            <option value="30" >30</option>
                            <option value="31" >31</option>
						</select>
					</td>
				</tr>
				</div>
				<tr>
					<th>Address</th>
					<td>
						<input type="text" id="zipcode" size="7" placeholder="우편번호" readonly>&nbsp;&nbsp;
						<input type="button" id="zip_chk" value="주소 검색" onclick="">
					</td>
					<td>
						<input type="text" id="address1" placeholder="주소를 입력하세요" readonly><br><br>
						<input type="text" id="address2" size="45" placeholder="상세 주소를 입력하세요">
					</td>
				</tr>
				<tr class="phone">
					<th>Phone</th>
					<td>
						<select id="hp_country" style="width:350px;height:30px;" name="hp_country">
							<option value="" selected="selected">- 국가 - </option>

							<option value="82">South Korea (대한민국) +82</option>
							<option value="86">China (中国) +86</option>
							<option value="81">Japan (日本) +81</option>
							<option value="1">United States +1</option>

							<option value="">------------------</option>

							<option value="886">Taiwan (台灣) +886</option>
							<option value="93">Afghanistan (‫افغانستان‬‎) +93</option>
							<option value="355">Albania (Shqipëri) +355</option>
							<option value="213">Algeria (‫الجزائر‬‎) +213</option>
							<option value="1684">American Samoa +1684</option>
							<option value="376">Andorra +376</option>
							<option value="244">Angola +244</option>
							<option value="1264">Anguilla +1264</option>
							<option value="1268">Antigua and Barbuda +1268</option>
							<option value="54">Argentina +54</option>
							<option value="374">Armenia (Հայաստան) +374</option>
							<option value="297">Aruba +297</option>
							<option value="61">Australia +61</option>
							<option value="43">Austria (Österreich) +43</option>
							<option value="994">Azerbaijan (Azərbaycan) +994</option>
							<option value="1242">Bahamas +1242</option>
							<option value="973">Bahrain (‫البحرين‬‎) +973</option>
							<option value="880">Bangladesh (বাংলাদেশ) +880</option>
							<option value="1246">Barbados +1246</option>
							<option value="375">Belarus (Беларусь) +375</option>
							<option value="32">Belgium (België) +32</option>
							<option value="501">Belize +501</option>
							<option value="229">Benin (Bénin) +229</option>
							<option value="1441">Bermuda +1441</option>
							<option value="975">Bhutan (འབྲུག) +975</option>
							<option value="591">Bolivia +591</option>
							<option value="387">Bosnia and Herzegovina (Босна и Херцеговина) +387</option>
							<option value="267">Botswana +267</option>
							<option value="55">Brazil (Brasil) +55</option>
							<option value="246">British Indian Ocean Territory +246</option>
							<option value="1284">British Virgin Islands +1284</option>
							<option value="673">Brunei +673</option>
							<option value="359">Bulgaria (България) +359</option>
							<option value="226">Burkina Faso +226</option>
							<option value="257">Burundi (Uburundi) +257</option>
							<option value="855">Cambodia (កម្ពុជា) +855</option>
							<option value="237">Cameroon (Cameroun) +237</option>
							<option value="1">Canada +1</option>
							<option value="238">Cape Verde (Kabu Verdi) +238</option>
							<option value="599">Caribbean Netherlands +599</option>
							<option value="1345">Cayman Islands +1345</option>
							<option value="236">Central African Republic (République centrafricaine) +236</option>
							<option value="235">Chad (Tchad) +235</option>
							<option value="56">Chile +56</option>
							<option value="86">China (中国) +86</option>
							<option value="61">Christmas Island +61</option>
							<option value="61">Cocos (Keeling) Islands +61</option>
							<option value="57">Colombia +57</option>
							<option value="269">Comoros (‫جزر القمر‬‎) +269</option>
							<option value="243">Congo (DRC) (Jamhuri ya Kidemokrasia ya Kongo) +243</option>
							<option value="242">Congo (Republic) (Congo-Brazzaville) +242</option>
							<option value="682">Cook Islands +682</option>
							<option value="506">Costa Rica +506</option>
							<option value="225">Côte d’Ivoire +225</option>
							<option value="385">Croatia (Hrvatska) +385</option>
							<option value="53">Cuba +53</option>
							<option value="599">Curaçao +599</option>
							<option value="357">Cyprus (Κύπρος) +357</option>
							<option value="420">Czech Republic (Česká republika) +420</option>
							<option value="45">Denmark (Danmark) +45</option>
							<option value="253">Djibouti +253</option>
							<option value="1767">Dominica +1767</option>
							<option value="1">Dominican Republic (República Dominicana) +1</option>
							<option value="593">Ecuador +593</option>
							<option value="20">Egypt (‫مصر‬‎) +20</option>
							<option value="503">El Salvador +503</option>
							<option value="240">Equatorial Guinea (Guinea Ecuatorial) +240</option>
							<option value="291">Eritrea +291</option>
							<option value="372">Estonia (Eesti) +372</option>
							<option value="251">Ethiopia +251</option>
							<option value="500">Falkland Islands (Islas Malvinas) +500</option>
							<option value="298">Faroe Islands (Føroyar) +298</option>
							<option value="679">Fiji +679</option>
							<option value="358">Finland (Suomi) +358</option>
							<option value="33">France +33</option>
							<option value="594">French Guiana (Guyane française) +594</option>
							<option value="689">French Polynesia (Polynésie française) +689</option>
							<option value="241">Gabon +241</option>
							<option value="220">Gambia +220</option>
							<option value="995">Georgia (საქართველო) +995</option>
							<option value="49">Germany (Deutschland) +49</option>
							<option value="233">Ghana (Gaana) +233</option>
							<option value="350">Gibraltar +350</option>
							<option value="30">Greece (Ελλάδα) +30</option>
							<option value="299">Greenland (Kalaallit Nunaat) +299</option>
							<option value="1473">Grenada +1473</option>
							<option value="590">Guadeloupe +590</option>
							<option value="1671">Guam +1671</option>
							<option value="502">Guatemala +502</option>
							<option value="44">Guernsey +44</option>
							<option value="224">Guinea (Guinée) +224</option>
							<option value="245">Guinea-Bissau (Guiné Bissau) +245</option>
							<option value="592">Guyana +592</option>
							<option value="509">Haiti +509</option>
							<option value="504">Honduras +504</option>
							<option value="852">Hong Kong (香港) +852</option>
							<option value="36">Hungary (Magyarország) +36</option>
							<option value="354">Iceland (Ísland) +354</option>
							<option value="91">India (भारत) +91</option>
							<option value="62">Indonesia +62</option>
							<option value="98">Iran (‫ایران‬‎) +98</option>
							<option value="964">Iraq (‫العراق‬‎) +964</option>
							<option value="353">Ireland +353</option>
							<option value="44">Isle of Man +44</option>
							<option value="972">Israel (‫ישראל‬‎) +972</option>
							<option value="39">Italy (Italia) +39</option>
							<option value="1876">Jamaica +1876</option>
							<option value="81">Japan (日本) +81</option>
							<option value="44">Jersey +44</option>
							<option value="962">Jordan (‫الأردن‬‎) +962</option>
							<option value="7">Kazakhstan (Казахстан) +7</option>
							<option value="254">Kenya +254</option>
							<option value="686">Kiribati +686</option>
							<option value="383">Kosovo +383</option>
							<option value="965">Kuwait (‫الكويت‬‎) +965</option>
							<option value="996">Kyrgyzstan (Кыргызстан) +996</option>
							<option value="856">Laos (ລາວ) +856</option>
							<option value="371">Latvia (Latvija) +371</option>
							<option value="961">Lebanon (‫لبنان‬‎) +961</option>
							<option value="266">Lesotho +266</option>
							<option value="231">Liberia +231</option>
							<option value="218">Libya (‫ليبيا‬‎) +218</option>
							<option value="423">Liechtenstein +423</option>
							<option value="370">Lithuania (Lietuva) +370</option>
							<option value="352">Luxembourg +352</option>
							<option value="853">Macau (澳門) +853</option>
							<option value="389">Macedonia (FYROM) (Македонија) +389</option>
							<option value="261">Madagascar (Madagasikara) +261</option>
							<option value="265">Malawi +265</option>
							<option value="60">Malaysia +60</option>
							<option value="960">Maldives +960</option>
							<option value="223">Mali +223</option>
							<option value="356">Malta +356</option>
							<option value="692">Marshall Islands +692</option>
							<option value="596">Martinique +596</option>
							<option value="222">Mauritania (‫موريتانيا‬‎) +222</option>
							<option value="230">Mauritius (Moris) +230</option>
							<option value="262">Mayotte +262</option>
							<option value="52">Mexico (México) +52</option>
							<option value="691">Micronesia +691</option>
							<option value="373">Moldova (Republica Moldova) +373</option>
							<option value="377">Monaco +377</option>
							<option value="976">Mongolia (Монгол) +976</option>
							<option value="382">Montenegro (Crna Gora) +382</option>
							<option value="1664">Montserrat +1664</option>
							<option value="212">Morocco (‫المغرب‬‎) +212</option>
							<option value="258">Mozambique (Moçambique) +258</option>
							<option value="95">Myanmar (Burma) (မြန်မာ) +95</option>
							<option value="264">Namibia (Namibië) +264</option>
							<option value="674">Nauru +674</option>
							<option value="977">Nepal (नेपाल) +977</option>
							<option value="31">Netherlands (Nederland) +31</option>
							<option value="687">New Caledonia (Nouvelle-Calédonie) +687</option>
							<option value="64">New Zealand +64</option>
							<option value="505">Nicaragua +505</option>
							<option value="227">Niger (Nijar) +227</option>
							<option value="234">Nigeria +234</option>
							<option value="683">Niue +683</option>
							<option value="672">Norfolk Island +672</option>
							<option value="850">North Korea (조선 민주주의 인민 공화국) +850</option>
							<option value="1670">Northern Mariana Islands +1670</option>
							<option value="47">Norway (Norge) +47</option>
							<option value="968">Oman (‫عُمان‬‎) +968</option>
							<option value="92">Pakistan (‫پاکستان‬‎) +92</option>
							<option value="680">Palau +680</option>
							<option value="970">Palestine (‫فلسطين‬‎) +970</option>
							<option value="507">Panama (Panamá) +507</option>
							<option value="675">Papua New Guinea +675</option>
							<option value="595">Paraguay +595</option>
							<option value="51">Peru (Perú) +51</option>
							<option value="63">Philippines +63</option>
							<option value="48">Poland (Polska) +48</option>
							<option value="351">Portugal +351</option>
							<option value="1">Puerto Rico +1</option>
							<option value="974">Qatar (‫قطر‬‎) +974</option>
							<option value="262">Réunion (La Réunion) +262</option>
							<option value="40">Romania (România) +40</option>
							<option value="7">Russia (Россия) +7</option>
							<option value="250">Rwanda +250</option>
							<option value="590">Saint Barthélemy (Saint-Barthélemy) +590</option>
							<option value="290">Saint Helena +290</option>
							<option value="1869">Saint Kitts and Nevis +1869</option>
							<option value="1758">Saint Lucia +1758</option>
							<option value="590">Saint Martin (Saint-Martin (partie française)) +590</option>
							<option value="508">Saint Pierre and Miquelon (Saint-Pierre-et-Miquelon) +508</option>
							<option value="1784">Saint Vincent and the Grenadines +1784</option>
							<option value="685">Samoa +685</option>
							<option value="378">San Marino +378</option>
							<option value="239">São Tomé and Príncipe (São Tomé e Príncipe) +239</option>
							<option value="966">Saudi Arabia (‫المملكة العربية السعودية‬‎) +966</option>
							<option value="221">Senegal (Sénégal) +221</option>
							<option value="381">Serbia (Србија) +381</option>
							<option value="248">Seychelles +248</option>
							<option value="232">Sierra Leone +232</option>
							<option value="65">Singapore +65</option>
							<option value="1721">Sint Maarten +1721</option>
							<option value="421">Slovakia (Slovensko) +421</option>
							<option value="386">Slovenia (Slovenija) +386</option>
							<option value="677">Solomon Islands +677</option>
							<option value="252">Somalia (Soomaaliya) +252</option>
							<option value="27">South Africa +27</option>
							<option value="211">South Sudan (‫جنوب السودان‬‎) +211</option>
							<option value="34">Spain (España) +34</option>
							<option value="94">Sri Lanka (ශ්‍රී ලංකාව) +94</option>
							<option value="249">Sudan (‫السودان‬‎) +249</option>
							<option value="597">Suriname +597</option>
							<option value="47">Svalbard and Jan Mayen +47</option>
							<option value="268">Swaziland +268</option>
							<option value="46">Sweden (Sverige) +46</option>
							<option value="41">Switzerland (Schweiz) +41</option>
							<option value="963">Syria (‫سوريا‬‎) +963</option>
							<option value="886">Taiwan (台灣) +886</option>
							<option value="992">Tajikistan +992</option>
							<option value="255">Tanzania +255</option>
							<option value="66">Thailand (ไทย) +66</option>
							<option value="670">Timor-Leste +670</option>
							<option value="228">Togo +228</option>
							<option value="690">Tokelau +690</option>
							<option value="676">Tonga +676</option>
							<option value="1868">Trinidad and Tobago +1868</option>
							<option value="216">Tunisia (‫تونس‬‎) +216</option>
							<option value="90">Turkey (Türkiye) +90</option>
							<option value="993">Turkmenistan +993</option>
							<option value="1649">Turks and Caicos Islands +1649</option>
							<option value="688">Tuvalu +688</option>
							<option value="1340">U.S. Virgin Islands +1340</option>
							<option value="256">Uganda +256</option>
							<option value="380">Ukraine (Україна) +380</option>
							<option value="971">United Arab Emirates (‫الإمارات العربية المتحدة‬‎) +971</option>
							<option value="44">United Kingdom +44</option>
							<option value="1">United States +1</option>
							<option value="598">Uruguay +598</option>
							<option value="998">Uzbekistan (Oʻzbekiston) +998</option>
							<option value="678">Vanuatu +678</option>
							<option value="39">Vatican City (Città del Vaticano) +39</option>
							<option value="58">Venezuela +58</option>
							<option value="84">Vietnam (Việt Nam) +84</option>
							<option value="681">Wallis and Futuna +681</option>
							<option value="212">Western Sahara (‫الصحراء الغربية‬‎) +212</option>
							<option value="967">Yemen (‫اليمن‬‎) +967</option>
							<option value="260">Zambia +260</option>
							<option value="263">Zimbabwe +263</option>
							<option value="358">Åland Islands +358</option>
						</select>
					</td>
					 <br>
					<td><input type="text" placeholder="전화번호를 입력하세요" size="15" required></td>
					<td></td><td></td>
				</tr>
				<tr>
					<td style="font-size:15px;">
						<input type="checkbox" id="chkbox" required><span><a href="">서비스 이용약관 및 운영원칙</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="">개인정보 수집 이용</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox"><span><a href="">위치정보 이용약관</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox"><span><a href="">프로모션 정보 수신</a>에 동의합니다.</span>
					</td>
					<td></td><td></td>
					<br><br><br><br>
				</tr>
				
				<div>
				<tr>
					<td colspan="10">
						<input type="submit" id="join" value="가 입 하 기"  style="width:300px;height:40px;"><br><br>
						<input type="button" id="reset" value="취 소" onclick="" style="width:300px;height:40px;">
					</td>
				</tr>
				</div>
			</table>
		</form>
	</div>
	<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>
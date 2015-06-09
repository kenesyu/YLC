$(function(){
	$("input[type='text']").not(".no").each(function(){
		$(this).placeholder();
	});
	$(".tabs").each(function(){
		$(this).tabs();
	});
	resize();
	$(window).resize(function(event) {
		resize();
	});










});

/*main*/
//

/*call*/
//
function resize(){
	var ht=$(window).height();
	$(".flht").height(ht);
};



/*
effect_val : 这是轮播的特效速度，默认为1000毫秒
interval_val : 这是轮播的间隔速度，默认为3000毫秒
icon_cut : 是否需要小图标切换，值为'yes'是要，不写或其他值为不要
a_href : 是否需要a标签链接，值为'yes'是要，不写或其他值为不要，链接地址可以直接给相应图片的href属性值
effect : 是什么特效，'slide'为滑动特效，'fade'为淡隐特效
*/

function xulin_banner(box,obj){
	var effect_val = obj&&obj.effect_val ? obj.effect_val : 1000;
	var interval_val = obj&&obj.interval_val ? obj.interval_val : 3000;
	var icon_cut = obj&&obj.icon_cut ? obj.icon_cut : 'yes';
	var a_href = obj&&obj.a_href ? obj.a_href : 'yes';
	var effect = obj&&obj.effect ? obj.effect : 'slide';		//值为'fade'时为淡隐效果；值为'slide'时为滑动效果
	
	var img = box.find('img');
	var length = img.length;
	var href = [];
	var txt = [];
	var src = [];
	(function(){
		for(var i = 0; i < length; i++){
			href[i] = img.eq(i).attr('href');
		};
	})();
	(function(){
		for(var i = 0; i < length; i++){
			txt[i] = img.eq(i).attr('text');
		};
	})();
	(function(){
		for(var i = 0; i < length; i++){
			src[i] = img.eq(i).attr('src');
		};
	})();
	img.remove();
	box.append('<div class="img"></div>');
	var div = box.find('div.img');
	div.append('<ul></ul>');
	var ul = div.find('ul');
	(function(){
		for(var i = 0; i < length; i++){
			ul.append('<li></li>');
		};
	})();
	var li = ul.find('li');
	var width = box.width();
	var height = box.height();
	box.css({
		'position' : 'relative'
	});
	div.css({
		'overflow' : 'hidden',
		'width' : '100%',
		'height' : height,
		'position' : 'absolute',
		'left' : 0,
		'top' : 0
	});
	ul.css({
		'width' : '100%',
		'height' : height,
		'position' : 'absolute',
		'left' : 0,
		'top' : 0
	});
	li.css({
		'width' : '100%',
		'height' : height,
		'position' : 'absolute',
		'backgroundRepeat' : 'no-repeat',
		'backgroundPosition' : 'center center',
		'left' : 0,
		'top' : 0
	});
	(function(){
		for(var i = 0; i < length; i++){
			li.eq(i).css({'backgroundImage' : 'url("' + src[i] + '")'});
		};
	})();
	if(icon_cut == 'yes'){		//底部切换图标
		box.append('<dl></dl>');
		var dl = box.find('dl');
		(function(){
			for(var i = 0; i < length; i++){
				dl.append('<dt></dt>');
			};
		})();
		var dt = dl.find('dt');
		dl.css({
			'float' : 'left',
			'position' : 'absolute',
			'bottom' : '8px'
		});
		dt.css({
			'float' : 'left',
			'width' : '15px',
			'height' : '15px',
			'margin' : '0 2px',
			'background' : '#fff',
			'cursor' : 'pointer',
			'overflow' : 'hidden',
			'textAlign' : 'center',
			'lineHeight' : '15px',
			'opacity' : '0.5'
		});
		(function(){
			for(var i = 0; i < length; i++){
				dt.eq(i).text(i + 1);
			};
		})();
		dl.css({
			'right' : '3px'
		});
		dt.eq(0).css({'opacity' : '1'});
	};
	if(a_href == 'yes'){		//a标签点击
		li.append('<a href="#"></a>');
		var a = li.find('a');
		a.css({
			'float' : 'left',
			'width' : '100%',
			'height' : height
		});
		(function(){
			for(var i = 0;i < length; i++){
				if(href[i]){
					a.eq(i).attr('href' , href[i]);				
				};
			};
		})();
	};
	//初始化
	li.hide();
	li.eq(0).show().addClass('cur');
	var start = 1;

	function next(start,width){
		if(effect == 'fade'){
			ul.find('li.cur').stop(true,true).fadeOut(effect_val);
			li.eq(start).stop(true,true).fadeIn(effect_val);
		}else if(effect == 'slide'){
			ul.find('li.cur').stop(true,true).animate({'left' : -width},effect_val,function(){
				$(this).hide();
			});
			li.eq(start).stop(true,true).animate({'left' : width},0,function(){
				li.eq(start).stop(true,true).animate({'left' : 0},effect_val)
			}).show();
		};
		li.removeClass('cur');
		li.eq(start).addClass('cur');
		if(icon_cut == 'yes'){
			dt.css({'opacity' : '0.5'});
			dt.eq(start).css({'opacity' : '1'});
		};
	};
	function repeat(){
		start = ul.find('li.cur').index() + 1;
		if(start == length){start = 0};
		next(start,width);
	};
	var swf = setInterval(function(){
		repeat();
	},interval_val);
	box.hover(function(){
		clearInterval(swf);
	},function(){
		swf = setInterval(function(){
			repeat();
		},interval_val);
	});
	if(icon_cut == 'yes'){
		dt.mouseover(function(){
			if($(this).index() != ul.find('li.cur').index()){
				start = $(this).index();
				if($(this).index() < ul.find('li.cur').index()){
					next(start,-width);
				}else if($(this).index() > ul.find('li.cur').index()){
					next(start,width);
				};
			};
		});
	};
};


/*
effect_val : 这是轮播的特效速度，默认为1000毫秒
interval_val : 这是轮播的间隔速度，默认为3000毫秒
text_explain : 是否需要文字说明 值为'yes'是要，不写或其他值为不要，说明文字直接给相应图片的text属性值
a_href : 是否需要a标签链接，值为'yes'是要，不写或其他值为不要，链接地址可以直接给相应图片的href属性值
show_img : 一次显示的图片张数
slide_img : 一次滑动的图片张数
*/
function xulin_product(box,obj){
	var effect_val =obj&&obj.effect_val ? obj.effect_val : 5000;
	var interval_val =obj&&obj.interval_val ? obj.interval_val : 5000;
	var text_explain =obj&&obj.text_explain ? obj.text_explain : 'yes';
	var a_href =obj&&obj.a_href ? obj.a_href : 'yes';
	var show_img =obj&&obj.show_img ? obj.show_img : 4;
	var slide_img =obj&&obj.slide_img ? obj.slide_img : 1;
	
	var src = [];
	var href = [];
	var txt = [];
	var img = box.find('img');
	var length = img.length;
	var img_width = img.eq(0).width();
	var img_height = img.eq(0).height();
	(function(){
		for(var i = 0; i < length; i++){
			src[i] = img.eq(i).attr('src');
		};
	})();
	(function(){
		for(var i = 0; i < length; i++){
			href[i] = img.eq(i).attr('href');
		};
	})();
	(function(){
		for(var i = 0; i < length; i++){
			txt[i] = img.eq(i).attr('text');
		};
	})();
	img.remove();
	var width = box.width();
	var height = box.height();
	box.append('<div class="img"></div>');
	var div = box.find('div');
	div.append('<ul></ul');
	var ul = div.find('ul');
	(function(){
		for(var i = 0; i < length; i++){
			ul.append('<li></li>');
		};
	})();
	var li = ul.find('li');
	var li_width = width/show_img;
	var li_height = height/show_img;
	box.css({
		'position' : 'relative'
	});
	div.css({
		'width' : '100%',
		'height' : img_height,
		'position' : 'relative',
		'top' : (height - img_height)/2,
		'overflow' : 'hidden'
	});
	ul.css({
		'width' : length*li_width*2,
		'height' : img_height,
		'position' : 'absolute'
	});
	li.css({
		'float' : 'left',
		'width' : img_width,
		'height' : img_height,
		'marginLeft' : (li_width - img_width)/2,
		'marginRight' : (li_width - img_width)/2,
		'position' : 'relative',
		'backgroundRepeat' : 'no-repeat',
		'backgroundPosition' : 'center top'
	});
	(function(){
		for(var i = 0; i < length; i++){
			li.eq(i).css({
				'backgroundImage' : 'url("' + src[i] + '")',
				'backgroundSize' : '100%'
			});
		};
	})();
	
	if(a_href == 'yes'){
		li.append('<a href="#"></a>');
		var a = li.find('a');
		a.css({
			'float' : 'left',
			'width' : '100%',
			'height' : img_height
		});
		(function(){
			for(var i = 0; i < length; i++){
				if(href[i]){
					a.eq(i).attr('href' , href[i]);
				};
			};
		})();
	};
	if(text_explain == 'yes'){
		if(a_href == 'yes'){
			a.append('<strong></strong>');
		}else{
			li.append('<strong></strong>');
		};
		var strong = li.find('strong');
		strong.css({
			'float' : 'left',
			'width' : '100%',
			'height' : '24px',
			'lineHeight' : '24px',
			'textAlign' : 'center',
			'color' : '#333',
			'position' : 'absolute',
			'left' : 0,
			'bottom' : 0
		});
		(function(){
			for(var i = 0; i < length; i++){
				if(txt[i]){
					strong.eq(i).text(txt[i]);
				}else{
					strong.eq(i).text('这是第' + (i + 1) + '张图片')
				};
			};
		})();
	};
	
	//初始化
	ul.append(ul.html());
	ul = div.find('ul');
	li = ul.find('li');
	var xx = effect_val;
	
	//轮播函数
	function next(width){
		ul.stop(true,true).animate({'left' : -(slide_img*width)},effect_val,'linear',function(){
			(function(){
				for(var i = 0; i < slide_img; i++){
					ul.find('li:first').appendTo(ul);
				};
			})();
			ul.stop(true,true).animate({'left' : 0},0)
		});
	};
	function prev(width){
		ul.stop(true,true).animate({'left' : -(slide_img*width)},0,function(){
			(function(){
				for(var i = 0; i < slide_img; i++){
					ul.find('li:last').prependTo(ul);
				};
			})();
			ul.stop(true,true).animate({'left' : 0},effect_val)
		});
	};
	next(li_width);
	var swf = setInterval(function(){
		next(li_width);
	},interval_val);
	box.hover(function(){
		clearInterval(swf);
	},function(){
		effect_val = xx;
		swf = setInterval(function(){
			next(li_width);
		},interval_val);
	});
};


















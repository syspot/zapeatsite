jQuery.fn.modal = function(a) {
	if (!a) {
		if (this.attr("href")) {
			var a = {
				url : this.attr("href")
			}
		}
	} else {
		if (!a.url) {
			if (this.attr("href")) {
				a.url = this.attr("href")
			}
		}
	}
	var c = {
		url : "#",
		backgroundColor : "#000",
		backgroundOpacity : 0.5,
		position : "center",
		referencePosition : this,
		top : 0,
		left : 0,
		closeEsc : true,
		closeClickOut : false,
		autoOpen : false
	};
	a = jQuery.extend(c, a);
	function b() {
		$("body").append($('<img class="load" />').attr({
			src : "/fw/img/2012/01/loader.gif",
			width : 50,
			height : 50
		})).append($("<div></div>").addClass("bg_modal")).append(
				$("<div></div>").addClass("view_modal"));
		var f = $("html")[0].scrollHeight < $(window).height() ? $(window)
				.height() : $("html")[0].scrollHeight;
		$(".bg_modal").width($("html")[0].scrollWidth).height(f);
		if (a.backgroundOpacity != 0) {
			$(".bg_modal").css("background-color", a.backgroundColor);
			$(".view_modal").css("opacity", 0);
			$(".bg_modal").css("opacity", 0)
		}
		$("select").css("visibility", "hidden");
		if (a.position == "relative") {
			var e = a.referencePosition.offset();
			leftModal = e.left;
			topModal = e.top
		}
		$(".bg_modal")
				.fadeTo(
						"fast",
						a.backgroundOpacity,
						function() {
							$(".view_modal")
									.load(
											a.url,
											function() {
												$(".load").remove();
												GB_getPageScrollTop = function() {
													var h;
													if (self.pageYOffset) {
														h = self.pageYOffset
													} else {
														if (document.documentElement
																&& document.documentElement.scrollTop
																|| document.documentElement.scrollLeft) {
															h = document.documentElement.scrollTop
														} else {
															if (document.body) {
																h = document.body.scrollTop
															}
														}
													}
													return h
												};
												if (a.position != "center") {
													var g = parseInt(a.top)
															+ parseInt(topModal)
															+ parseInt($(
																	".view_modal")
																	.height());
													if (f < g) {
														a.top = 0;
														topModal = f
																- parseInt($(
																		".view_modal")
																		.height())
													}
													$(".view_modal").css({
														marginTop : topModal,
														marginLeft : leftModal,
														left : a.left,
														top : a.top
													})
												} else {
													$(".view_modal")
															.css(
																	{
																		marginTop : /*'65px'*/parseInt(GB_getPageScrollTop()
																				- ($(
																						".view_modal")
																						.height() / 2)),
																		marginLeft : -parseInt($(
																				".view_modal")
																				.width() / 2)
																	})
												}
												if (a.backgroundOpacity != 0) {
													$(".view_modal").fadeTo(
															"fast", 1)
												}
												$("a[rel='modalclose']").click(
														function() {
															d();
															return false
														})
											})
						});
		if (a.closeClickOut == true) {
			$(".bg_modal").click(function() {
				d()
			})
		}
		if (a.closeEsc == true) {
			$(window).keydown(function(g) {
				if (g.keyCode == 27) {
					d()
				}
			})
		}
		return false
	}
	if (a.autoOpen == false) {
		this.click(b)
	} else {
		b()
	}
	function d() {
		$(".view_modal").fadeTo("fast", 0, function() {
			$(this).remove()
		});
		$(".bg_modal").fadeTo("fast", 0, function() {
			$(this).remove();
			$("select").css("visibility", "visible")
		});
		$(window).unbind();
		$(".bg_modal").unbind()
	}
	this.css("visibility", "visible")
};
$(document).ready(function() {
	$('a[rel="modal"]').each(function() {
		$(this).modal()
	})
});
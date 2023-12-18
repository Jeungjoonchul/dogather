	function contextPath(){
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
		return contextPath;
	}
	const cp = contextPath();
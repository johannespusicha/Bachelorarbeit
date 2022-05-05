if FORMAT:match 'latex' then
	function Para (elem)
		return pandoc.read('Das ist ein Text' .. elem.content, 'markdown').blocks
	end
end

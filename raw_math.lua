if FORMAT:match 'latex' then
	function Math (elem)
		return pandoc.RawInline('latex', elem.text)
	end
end

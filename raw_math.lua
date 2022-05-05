if FORMAT:match 'latex' then
	function Math (elem)
		if elem.mathtype:match 'DisplayMath' then
			return pandoc.RawInline('latex', elem.text)
		end
	end
end

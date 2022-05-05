if FORMAT:match 'latex' then
  function Math (elem)
	return {
		pandoc.Para(pandoc.Str('Gleichung:')),
		elem
	}
    -- Return raw Tes if Block Math
	-- if elem.mathtype:match 'DisplayMath' then
	-- 	return {
	--       pandoc.RawBlock('latex', elem.text)
	--     }
	-- end
	-- if elem.mathtype:match 'InlineMath' then
	-- 	return {
	-- 	elem
	-- 	}
	-- end
  end
end

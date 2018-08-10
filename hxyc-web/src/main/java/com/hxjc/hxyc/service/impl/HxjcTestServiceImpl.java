package com.hxjc.hxyc.service.impl;

import com.hxjc.hxyc.mapper.HxjcMapper;
import com.hxjc.hxyc.mapper.HxycTestMapper;
import com.hxjc.hxyc.model.HxjcTest;
import com.hxjc.hxyc.model.HxycTest;
import com.hxjc.hxyc.service.HxjcTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HxjcTestServiceImpl implements HxjcTestService {

    @Autowired
    private HxycTestMapper hxycTestMapper;

    @Autowired
    private HxjcMapper hxjcMapper;


    @Override
    public HxycTest getHxycTest() {
        HxycTest hxycTest = hxycTestMapper.findHxycTest(Long.valueOf("1"));

        return hxycTest;
    }

    @Override
    public HxjcTest getHxjcTest() {
        HxjcTest hxjcTest = null; // hxjcMapper.findHxjcTest(Long.valueOf("1"));

        return hxjcTest;
    }
}

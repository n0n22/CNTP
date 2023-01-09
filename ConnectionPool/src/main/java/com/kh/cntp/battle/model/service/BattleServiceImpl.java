package com.kh.cntp.battle.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.battle.model.dao.BattleDao;

@Service
public class BattleServiceImpl implements BattleService{
	@Autowired
	private BattleDao battleDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

}

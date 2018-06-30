package com.stort.dao;

import com.stort.bean.Commodit;
import com.stort.bean.CommoditExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommoditMapper {
    long countByExample(CommoditExample example);

    int deleteByExample(CommoditExample example);

    int deleteByPrimaryKey(Integer number);
    
    List<Commodit> selectByShopNum(@Param("shopnum")Integer shopnum);
    
    List<Commodit> selectBySearch(@Param("searchText")String searchText);
    
    int insert(Commodit record);

    int insertSelective(Commodit record);

    List<Commodit> selectByExample(CommoditExample example);

    Commodit selectByPrimaryKey(Integer number);

    int updateByExampleSelective(@Param("record") Commodit record, @Param("example") CommoditExample example);

    int updateByExample(@Param("record") Commodit record, @Param("example") CommoditExample example);

    int updateByPrimaryKeySelective(Commodit record);

    int updateByPrimaryKey(Commodit record);
}
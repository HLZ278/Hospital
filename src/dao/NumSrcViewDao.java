package dao;
import entity.NumSrc;
import entity.NumSrcView;

import java.util.List;

public interface NumSrcViewDao {
	public List<NumSrcView> queryNumSrcView(int departmentID);

}

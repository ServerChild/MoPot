package com.mopot.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;

/*import java.awt.print.Pageable;*/
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.SortDirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mopot.domain.Content;
import com.mopot.domain.Member;
import com.mopot.domain.Reply;
import com.mopot.repository.ContentRepository;
import com.mopot.service.ContentService;
import com.mopot.service.ReplyService;

import jakarta.servlet.http.HttpSession;
/*import net.bytebuddy.matcher.ModifierMatcher.Mode;*/

@Controller
public class ContentController {

	// 글
	@Autowired
	ContentService contentService;

	// 댓글
	@Autowired
	ReplyService replyService;

	// 전역변수
	private Member loginUser;

	// 폼 불러오기
	@RequestMapping("/form")
	public String form() {
		return "Content/form";
	}

	/* 폼 입력하기 페이지 */
	@RequestMapping("/insertForm")
	public String insertForm(@ModelAttribute Content content, Model model) {
		Content savedContent = contentService.insert(content);
		model.addAttribute("savedContent", savedContent);
		return "redirect:/list";
	}

	/* 1. 공지사항 출력(if문으로 공지사항 일치여부 확인)  */
	
	/* 2. 베스트 글 출력 (상위3개만 출력) */

	@RequestMapping("/list")
	public String List() {
		return "Content/list";
	}

	/* 3. 리스트 출력 부분 - (1) + (2) + 검색 보기 페이지 함께 구성 */
	@GetMapping("/list")
	public String list(Content content, Model model, HttpSession session, // 현재 페이지에서 사용
			@RequestParam(value = "nowPage", defaultValue = "0") int nowPage,
			@PageableDefault(page = 0, size = 10, sort = "conCreate", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "searchType", required = false) String searchType
	)

	{
		/* 1. 공지사항의 경우 - 카테고리가 공지사항인 것만 갖고온다  */ 
		model.addAttribute("contentPageNotice", contentService.contentNoticeList("공지사항",pageable));

		/* 2. 베스트 글 출력 (상위3개만 출력) - 조회수가 가장 높은 3개 갖고 온다 */
		model.addAttribute("contentPageBest3", contentService.findTop3ContentsByConCount());

		/* 전체, 검색 해서 출력  */
		if (searchKeyword == null) {
			// Page<Content> list = contentService.contentList(pageable);
			// model.addAttribute("contentPage",
			// contentService.contentList(PageRequest.of(nowPage, 10)));
			model.addAttribute("contentPage", contentService.contentList(pageable));
			model.addAttribute("nowPage", nowPage);
		} 
			/* 제목 검색 */
			else if ("conTitle".equals(searchType)) {
			model.addAttribute("contentPage", contentService.conTitleSearchList(searchKeyword, pageable));
			model.addAttribute("nowPage", nowPage);
		} 
			/* 내용 검색 */
			else if ("conDetail".equals(searchType)) {
			model.addAttribute("contentPage", contentService.conDetailSearchList(searchKeyword, pageable));
			model.addAttribute("nowPage", nowPage);
		} 
			/* 작성자 검색 */
			else if ("conWriter".equals(searchType)) {
			model.addAttribute("contentPage", contentService.conWriterSearchList(searchKeyword, pageable));
			model.addAttribute("nowPage", nowPage);
		} 
			/* 태그 검색 */
			else if ("conTag".equals(searchType)) {
			model.addAttribute("contentPage", contentService.conTagSearchList(searchKeyword, pageable));
			model.addAttribute("nowPage", nowPage);
		}

		// 로그인 시 사용
		/*if(session.getAttribute("loginUser") != null) {
			loginUser = (Member)session.getAttribute("loginUser");
			model.addAttribute("loginUser",loginUser);
		}*/
		return "/Content/list";
	}

	/* 자세히 보기 페이지 */
	@GetMapping("/detailForm")
	public String detailForm(@RequestParam("conNo") Long conNo, Model model) {

		/* 로그인 했을 때 수정 
		 * if(loginUser != null) {
		model.addAttribute("loginUser",loginUser);
		}
		*/

		if (loginUser == null) {
			model.addAttribute("content", contentService.selectDetail(conNo).get());
			model.addAttribute("rlist", replyService.findAllByRefCnoOrderByReNoDesc(conNo));
		} else {
			return "redirect:/error";
		}

		return "Content/detailForm";
	}

	/* 글 수정하기 */
	@PostMapping("/update")
	public String update(Content content) {
		contentService.update(content);
		return "redirect:/list";
	}

	/* 글 삭제하기 */
	@RequestMapping("/contentDelete/{conNo}")
	public String contentDelete(@PathVariable(name = "conNo") long conNo) throws Exception {
		contentService.contentDelete(conNo);
		return "redirect:/list";
	}

	/* 조회수 */

	/* 댓글수 리스트 반영 업데이트 함수  (+1) */
	@PostMapping("/updateReplyCntPlus.bo")
	public String updateReplyCntPlus(@RequestParam("conNo") Long conNo, Model model) {
		model.addAttribute("content", contentService.updateReplyCntPlus(conNo).get());
		return "redirect:/detailForm?conNo=" + conNo;
	}

	/* 댓글수 리스트 반영 업데이트 함수  (-1) */
	@PostMapping("/updateReplyCntMinus.bo")
	public String updateReplyCntMinus(@RequestParam("conNo") Long conNo, Model model) {
		model.addAttribute("content", contentService.updateReplyCntMinus(conNo).get());
		return "redirect:/detailForm?conNo=" + conNo;
	}

}
